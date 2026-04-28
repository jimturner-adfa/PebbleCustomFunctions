#!/bin/bash
rm core-example.cgt
pushd core-example
zip -r -9 ../core-example.cgt *
popd
adb push core-example.cgt /sdcard/Download
