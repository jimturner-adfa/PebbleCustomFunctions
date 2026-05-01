#!/bin/bash
read -p "Enter directory name -> " DIR_NAME
# Verify if the directory exists
if [ -d "$DIR_NAME" ]; then
    echo "Success: '$DIR_NAME' exists and is a directory."
    pushd $DIR_NAME
    mv gradle/wrapper/gradle-wrapper.properties  gradle/wrapper/gradle-wrapper.properties.peb
    mv settings.gradle.kts settings.gradle.kts.peb
    mv app/src/main/res/values/strings.xml app/src/main/res/values/strings.xml.peb
    find . -name "*.java"  -exec mv {} {}.peb \;
    find . -name "*.kt"    -exec mv {} {}.peb \;
    find . -name "*.kts"   -exec mv {} {}.peb \;
    find . -type f -name "*.peb" -print0 | while IFS= read -r -d '' file; do
    echo "Processing: $file"
    emacs $file
done

    popd
else
    echo "Error: '$DIR_NAME' does not exist or is not a directory."
fi
