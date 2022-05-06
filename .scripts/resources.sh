#!/bin/bash

# Directory of the main bundle.
BUILD_APP_DIR=${BUILT_PRODUCTS_DIR}/${FULL_PRODUCT_NAME}

# Directory of the script.
cd "${0%/*}"

# Skip the for loop if there are no glob matches.
shopt -s nullglob

# Search for resources.
for i in ../Sources/*/Resources/*.*; do (
    # Get the file name of the resource.
    file=$(echo $i | sed -E 's/.*\///g')
    # Copy the file to the main bundle.
    \cp -R "$i" "$BUILD_APP_DIR/$file"
    # Log.
    echo "Copied $i to $BUILD_APP_DIR/$file"
) & done;
