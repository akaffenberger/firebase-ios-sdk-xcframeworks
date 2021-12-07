#!/bin/bash

latest_release_number () {
    # Github cli to get the latest release
    gh release list --repo $1 --limit 1 |
    # Regex to find the version number
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' |
    # Take the first match in the regex
    head -1
}

xcframework_name () {
    echo $1 | sed -E 's/.*\/|\.xcframework|\.xcframework\.zip//g'
}

file_name () {
    echo $1 | sed -E 's/.*\///g'
}

library_name () {
    echo $1 | sed -E 's/\/|\/.*\.xcframework|\/.*\.xcframework\.zip//g'
}

prepare_scratch () {
    # Create temporary directory
    scratch=$(mktemp -d -t TemporaryDirectory)
    cd $scratch

    finish () {
        # Remove temporary directory
        rm -rf "$scratch"
    }

    # Run cleanup on exit
    trap finish EXIT
}

zip_frameworks () {
    for i in */*.xcframework; do
        name=`xcframework_name $i`
        cd "$i/../"; zip -rmq "$name.xcframework.zip" "$name.xcframework"; cd ..
    done;
}

prepare_files_for_distribution () {
    dist=$1

    # Create the distribution folder
    mkdir $dist

    # Move all xcframeworks to the distribution folder
    for i in */*.xcframework.zip; do
        cp -f $i $dist
    done;
}

generate_sources () {
    directory="$1"
    sources="$1/Sources"

    # Remove any existing sources
    rm -rf $sources
    mkdir $sources

    # The sources for the umbrella header and modulemap
    mkdir "$sources/Firebase"
    cp -f "Firebase.h" "$sources/Firebase"
    cp -f "module.modulemap" "$sources/Firebase"
    touch "$sources/Firebase/dummy.m"

    # Create a source folder for each library
    for i in */; do
        name="$(library_name $i)Target"
        mkdir "$sources/$name"
        touch "$sources/$name/dummy.swift"
        # Copy resources for the library to the source folder
        if [ -d "$i/Resources" ]; then
            cp -rf "$i/Resources" "$sources/$name"
        fi
    done;
}

output_binary_target () {
    file=$1
    repo=$2
    version=$3
    output=$4
    comma=$5

    # Get the checksum
    touch Package.swift
    checksum=`swift package compute-checksum "$file"`
    name=`xcframework_name $file`
    library=`library_name $file`

    # Write to file
    touch $output
    printf "$comma
    .binaryTarget(
      name: \"$name\",
      url: \"$repo/releases/download/$version/$name.xcframework.zip\",
      checksum: \"$checksum\"
    )" >> $output
    echo "$file prepared"
}

output_library () {
    library=`library_name $1`
    output=$2
    comma=$3

    # Write to file
    touch $output
    printf "$comma
    .library(
      name: \"$library\",
      targets: [\"${library}Target\"]
    )" >> $output
    echo "$library prepared."
}

output_library_target () {
    library=`library_name $1`
    output=$2
    comma=$3
    target="${library}Target"
    dependencies=`ls -1A $library | grep .xcframework.zip`
    resources="$1/Resources"

    # Write to file
    touch $output
    printf "$comma
    .target(
      name: \"$target\",
      dependencies: [
        \"Firebase\"" >> $output

    # All targets depend on the core FirebaseAnalytics binaries
    if [ $target != "FirebaseAnalyticsTarget" ]; then
        printf ",\n        \"FirebaseAnalyticsTarget\"" >> $output
    fi
    # Other binary dependencies are expected to be inside the library folder
    echo "$dependencies" | while read -r dependency; do
        printf ",\n        \"$(xcframework_name $dependency)\"" >> $output
        comma=","
    done
    printf "\n      ]" >> $output

    # Optional resource files
    if [ -d "$resources" ]; then
        printf ",\n      resources: [" >> $output
        comma=""
        for i in "$resources/*"; do
            printf "$comma\n        .process(\"Resources/$(file_name $i)\")" >> $output
            comma=","
        done;
        printf "\n      ]" >> $output
    fi
    printf "\n    )" >> $output

    echo "$target prepared"
}

output_swift_package () {
    package="$1/Package.swift"
    sources="$1/Sources"

    # Create Package.swift
    rm -f $package
    touch $package
    printf "
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: \"Firebase\",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [" >> $package
    # Create libraries
    comma=""
    for i in */; do
        output_library $i $package $comma
        comma=","
    done;
    printf "
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: \"Firebase\",
      publicHeadersPath: \"./\"
    )," >> $package

    # Create targets
    comma=""
    # Library targets that define each library's binary dependencies and resources
    for i in */; do
        output_library_target $i $package $comma
        comma=","
    done;
    # Binary targets, these will be hosted on a github repo release
    for i in $1/dist/*.xcframework.zip; do
        output_binary_target $i $xcframeworks_repo $latest $package $comma
        comma=","
    done;
    printf "
  ]
)
" >> $package
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

# Current directory
directory="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Repos
firebase_repo="https://github.com/firebase/firebase-ios-sdk"
xcframeworks_repo="https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks"

# Release versions
latest=$(latest_release_number $firebase_repo)
current=$(latest_release_number $xcframeworks_repo)

echo "Upstream: $latest"
echo "Current: $current"

if [ $latest != $current ]; then
    echo "Version is out of date. Updating..."
    prepare_scratch
    echo "Downloading latest release..."
    gh release download --pattern 'Firebase.zip' --repo $firebase_repo
    echo "Unzipping.."
    unzip -q Firebase.zip
    echo "Preparing xcframeworks for distribution..."
    cd Firebase
    zip_frameworks
    echo "Creating distribution files..."
    prepare_files_for_distribution "$directory/dist"
    echo "Creating source files..."
    generate_sources $directory
    echo "Creating Package.swift..."
    output_swift_package $directory
    echo "Merging changes to Github..."
    cd $directory
    commit_changes "release/$latest"
    merge_changes
    echo "Creating release"
    echo "Release $latest" | gh release create $latest ./dist/*.xcframework.zip
else
    echo "Up to date."
fi

echo "Done."
