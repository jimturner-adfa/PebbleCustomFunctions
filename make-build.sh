#!/bin/bash
rm core-build.cgt
pushd core-build
zip -r -9 ../core-build.cgt *
popd
adb push core-build.cgt /sdcard/Download
