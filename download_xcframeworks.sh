#!/bin/bash

latest_release_number () {
    # Github cli to get the latest release
    gh release list --repo $1 --limit 1 |
    # Regex to find the version number
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' |
    # Take the first match in the regex
    head -1
}

prepare_scratch () {
    # Create temporary directory
    scratch=$(mktemp -d -t TemporaryDirectory)
    open $scratch && cd $scratch

    finish () {
        # Remove temporary directory
        rm -rf "$scratch"
    }

    # Run cleanup on exit
    trap finish EXIT
}

zip_framework () {
    zip -0 -rmq "$(library_name $1)/$(library_name $1)-$(xcframework_name $1).xcframework.zip" "$1"
}

xcframework_name () {
    echo $1 | sed -E 's/.*\/|\.xcframework|\.xcframework\.zip//g'
}

library_name () {
    echo $1 | sed -E 's/\/|\/.*\.xcframework|\/.*\.xcframework\.zip//g'
}

output_target () {
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
    targets=`ls -1A $library | grep .xcframework.zip`

    # Write to file
    if [[ -n $targets ]]; then
        touch $output
        printf "$comma
    .library(
      name: \"$library\",
      targets: [" >> $output
        comma=""
        echo "$targets" | while read -r target; do
            printf "$comma\n        \"$(xcframework_name $target)\"" >> $output
            comma=","
        done
        printf "\n      ]\n    )" >> $output
        echo "$library prepared."
    fi
}

output_swift_package () {
    package="$1/Package.swift"

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
  targets: [" >> $package
    # Create targets
    comma=""
    for i in */*.xcframework.zip; do
        output_target $i $xcframeworks_repo $latest $package $comma
        comma=","
    done;
    printf "
  ]
)
" >> $package
}

prepare_files_for_distribution () {
    dist=$1

    # Create the distribution folder
    mkdir $dist

    # Move all xcframeworks to the distribution folder
    for i in */*.xcframework.zip; do
        mv $i $dist
    done;
}

commit_changes() {
    branch=$1
    git checkout -b $branch
    git add .
    git commit -m"Updated Package.swift for latest firebase sdks"
    git push -u origin $branch
}

merge_changes () {
    gh pr create --fill
    gh pr merge -d
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
#    echo "Version is out of date. Updating..."
#    prepare_scratch
#    echo "Downloading latest release..."
#    gh release download --pattern 'Firebase.zip' --repo $firebase_repo
#    echo "Unzipping.."
#    unzip -q Firebase.zip
#    echo "Preparing xcframeworks for release..."
#    cd Firebase
#    for i in */*.xcframework; do
#        zip_framework $i
#    done;
#    echo "Creating Package.swift..."
#    output_swift_package $directory
#    echo "Creating distribution files..."
#    prepare_files_for_distribution "$directory/dist"
#    echo "Merging changes to Github..."
#    cd $directory
#    commit_changes "release/$latest"
    merge_changes
#    echo "Creating release"
#    echo "Release $latest" | gh release create $latest ./dist/*.xcframework.zip
else
    echo "Up to date."
fi

echo "Done."
