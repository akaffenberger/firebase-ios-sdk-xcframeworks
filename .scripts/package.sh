#!/bin/bash

latest_release_number () {
    # Github cli to get the latest release
    gh release list --repo $1 --limit 1 |
    # Regex to find the version number, assumes semantic versioning
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' |
    # Take the first match in the regex
    head -1
}

xcframework_name () {
    # Filter out path and extension to get the framework name
    # Ex. xcframework_name "FirebaseFirestore/leveldb-library.xcframework" = "leveldb-library"
    echo $1 | sed -E 's/.*\/|\.xcframework|\.xcframework\.zip//g'
}

resource_name () {
    # Filter out path to get the file name
    # Ex. file_name "FirebaseFirestore/Resources/gRPCCertificates-Cpp.bundle" = "gRPCCertificates-Cpp.bundle"
    echo $1 | sed -E 's/.*\///g'
}

library_name () {
    # Filter out path to get the folder name
    # Ex. library_name "FirebaseAnalytics/FirebaseInstallations.xcframework" = "FirebaseAnalytics"
    echo $1 | sed -E 's/\/|\/.*\.xcframework|\/.*\.xcframework\.zip//g'
}

trim_empty_lines () {
    # Delete all empty lines in a file
    sed -i '' '/^$/d' $1
}

template_replace () {
    local file=$(cat $1)
    # Replace the template with the contents of the replacement file
    local result=${file//"$2"/"$(trim_empty_lines $3; cat $3)"}
    # Write the result back to the original file
    rm -f $1; touch $1; printf "$result" >> $1
}

create_scratch () {
    # Create temporary directory
    scratch=$(mktemp -d -t TemporaryDirectory)
    open $scratch
    # Run cleanup on exit
    trap "read -p \"\"; rm -rf \"$scratch\"" EXIT
}

zip_frameworks () {
    for i in */*.xcframework; do (
        cd "$i/../";
        # Suffix to avoid target name collision
        local name=$(xcframework_name $i); suffix="-xcf"
        # Rename the framework
        mv "$name.xcframework" "${name}${suffix}.xcframework"
        # Zip the framework
        zip -rq "${name}${suffix}.xcframework.zip" "${name}${suffix}.xcframework"
    ) & done;
    wait
}

prepare_files_for_distribution () {
    local dist="$1"
    # Create the distribution folder
    mkdir $dist
    # Copy unzipped frameworks for testing (Package.swift using local binaries)
    for i in */*.xcframework; do cp -rf $i $dist; done
    # Copy zipped frameworks for release (these will be uploaded to remote)
    for i in */*.xcframework.zip; do cp -f $i $dist; done
}

generate_sources () {
    local sources="$1"
    # Create the sources folder
    mkdir $sources
    # Create the sources for the umbrella header and modulemap
    mkdir "$sources/Firebase"
    cp -f "Firebase.h" "$sources/Firebase"
    cp -f "module.modulemap" "$sources/Firebase"
    touch "$sources/Firebase/dummy.m" # SPM requires at least one source file
    # Create a source folder for each library target
    for i in */; do
        local name="$(library_name $i)";
        mkdir "$sources/$name"
        touch "$sources/$name/dummy.swift" # SPM requires at least one source file
        # Copy resources for the target to the source folder
        if [ -d "$i/Resources" ]; then
            cp -rf "$i/Resources" "$sources/$name"
        fi
    done;
}

write_library () {
    local library=$(library_name $1)
    local output="$2"
    local comma="$3"

    # Write to file
    touch $output
    printf "$comma
    .library(
      name: \"$library\",
      targets: [\"$library\"]
    )" >> $output
}

conditional_dependency () {
    local name=$(xcframework_name "$1")
    local output="$2"
    # Check xcframework folder for platform specific architectures
    local ios=$(ls "$name.xcframework" | grep "ios-" >/dev/null && echo ".iOS")
    local tvos=$(ls "$name.xcframework" | grep "tvos-" >/dev/null && echo ".tvOS")
    local macos=$(ls "$name.xcframework" | grep "macos-" >/dev/null && echo ".macOS")
    # Get array of platforms
    local platforms=($ios $tvos $macos)
    # Join platforms with comma and space separation
    local joined=$( echo ${platforms[*]} | sed 's/ /, /g' )
    if [ "$joined" == ".iOS, .tvOS, .macOS" ]; then
        # Supports all platforms, conditional not needed
        echo "\"$name\""
    else
        # Create conditional dependency from target and platforms
        echo ".target(name: \"$name\", condition: .when(platforms: [$joined]))"
    fi
}

write_target () {
    local library=$(library_name $1)
    local output=$2
    local comma=$3
    local target="$library"
    local dependencies=$(ls -1A $library | grep .xcframework.zip)

    # Write to file
    touch $output
    printf "$comma
    .target(
      name: \"$target\",
      dependencies: [
        \"Firebase\"" >> $output
    # All targets depend on the core FirebaseAnalytics binaries
    if [ $target != "FirebaseAnalytics" ]; then printf ",
        \"FirebaseAnalytics\"" >> $output
    fi
    # Library specific dependencies are expected to be inside the $library folder
    echo "$dependencies" | while read -r dependency; do printf ",
        $(cd $library; conditional_dependency $dependency)" >> $output
    done
    # Resources are expected to be inside the $library/Resources folder
    if [ -d "$library/Resources" ]; then
        printf "\n      ],\n      resources: [" >> $output
        comma=""; for i in "$library/Resources/*"; do printf "$comma
        .process(\"Resources/$(resource_name $i)\")" >> $output; comma=","
        done;
    fi
    # Closing brackets
    printf "\n      ]\n    )" >> $output
}

write_binary () {
    local file=$1
    local repo=$2
    local version=$3
    local output=$4
    local comma=$5

    # Get the checksum
    touch Package.swift # checksum command requires a package file
    local checksum=$(swift package compute-checksum "$file")
    local name=$(xcframework_name $file)
    local library=$(library_name $file)

    # Write to file
    touch $output
    printf "$comma
    .binaryTarget(
      name: \"$name\",
      url: \"$repo/releases/download/$version/$name.xcframework.zip\",
      checksum: \"$checksum\"
    )" >> $output
}

write_local_binary () {
    local name=$(xcframework_name "$1")
    local dist=$2
    local output=$3
    local comma=$4

    # Write to file
    touch $output
    printf "$comma
    .binaryTarget(
      name: \"$name\",
      path: \"$dist/$name.xcframework\"
    )" >> $output
}

generate_swift_package () {
    local package="$1"
    local template="$2"
    local dist="$3"
    local repo="$4"
    local local_dist="$5"
    local libraries="libraries.txt"
    local targets="targets.txt"
    local binaries="binaries.txt"
    # Create package file
    cp -f $template $package
    # Create libraries
    comma=""; for i in */; do write_library $i $libraries $comma && comma=","; done
    # Create targets that define each library's dependencies and resources
    comma=""; for i in */; do write_target $i $targets $comma && comma=","; done
    # Create binary targets
    if [[ -n $local_dist ]]; then
        echo "Creating local Package.swift for testing..."
        # Create locally pathed binary targets, useful for testing/validating
        comma=""; for i in $dist/*.xcframework; do write_local_binary $i $local_dist $binaries $comma && comma=","; done
    else
        echo "Creating release Package.swift..."
        # Create remote binary targets, these will be hosted on a github release
        comma=""; for i in $dist/*.xcframework.zip; do write_binary $i $repo $latest $binaries $comma && comma=","; done
    fi
    # Replace the templates with the generated values
    template_replace $package "// GENERATE LIBRARIES" $libraries; rm -f $libraries
    template_replace $package "// GENERATE TARGETS" $targets; rm -f $targets
    template_replace $package "// GENERATE BINARIES" $binaries; rm -f $binaries
}

commit_changes() {
    branch=$1
    git checkout -b $branch
    git add .
    git commit -m"Updated Package.swift and sources for latest firebase sdks"
    git push -u origin $branch
}

merge_changes () {
    gh pr create --fill
    gh pr merge -rd
}

# Exit when any command fails
set -e
set -o pipefail

# Repos
firebase_repo="https://github.com/firebase/firebase-ios-sdk"
xcframeworks_repo="https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks"

# Release versions
latest=$(latest_release_number $firebase_repo)
current=$(latest_release_number $xcframeworks_repo)

if [ $latest != $current ]; then
    echo "$current is out of date. Updating to $latest..."
    distribution="dist"
    sources="Sources"
    package="Package.swift"

    # Generate files in a temporary directory
    # Use subshell to return to original directory when finished with scratchwork
    create_scratch
    (
        cd $scratch
        home=$OLDPWD
        echo "Downloading latest release..."
        gh release download --pattern 'Firebase.zip' --repo $firebase_repo
        echo "Unzipping.."
        unzip -q Firebase.zip
        echo "Preparing xcframeworks for distribution..."
        cd Firebase
        zip_frameworks
        echo "Creating distribution files..."
        prepare_files_for_distribution "../$distribution"
        echo "Creating source files..."
        generate_sources "../$sources"
        # Create test package using local binaries and make sure it builds
        generate_swift_package "../$package" "$home/package_template.swift" "../$distribution" $xcframeworks_repo $distribution
        echo "Validating..."
        (cd ..; swift package dump-package | read pac)
        (cd ..; swift build) # TODO: create tests and replace this line with `(cd ..; swift test)`
        # Create release package using remote binaries and make sure the Package.swift file is parseable
        generate_swift_package "../$package" "$home/package_template.swift" "../$distribution" $xcframeworks_repo ''
        echo "Validating..."
        (cd ..; swift package dump-package | read pac)
    )

#    echo "Moving files to repo..."
#    cd ..
#    # Remove any existing files
#    if [ -d $distribution ]; then rm -rf "$distribution"; fi
#    if [ -d $sources ]; then rm -rf "$sources"; fi
#    if [ -f $package ]; then rm -f "$package"; fi
#    # Move generated files into the repo directory
#    mv "$scratch/$distribution" "$distribution"
#    mv "$scratch/$sources" "$sources"
#    mv "$scratch/$package" "$package"
#    # Deploy to repository
#    echo "Merging changes to Github..."
#    commit_changes "release/$latest"
#    merge_changes
#    echo "Creating release"
#    echo "Release $latest" | gh release create $latest ./dist/*.xcframework.zip
else
    echo "$current is up to date."
fi

echo "Done."
