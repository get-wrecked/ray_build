#!/bin/bash

mkdir wheels
for TARGET in "manylinux2014_x86_64" "macosx_11_0_arm64"; do
    mkdir wheel_${TARGET}
    cd wheel_${TARGET}

    wget "https://s3-us-west-2.amazonaws.com/ray-wheels/latest/ray-3.0.0.dev0-cp312-cp312-${TARGET}.whl"
    mv ray-3.0.0.dev0-cp312-cp312-${TARGET}.whl ray-wheel.zip
    unzip ray-wheel.zip
    rm ray-wheel.zip

    rm -rf ray/python
    cp -r ../ray/python ray/python

    zip -r ray-wheel.zip *
    mv ray-wheel.zip ../wheels/ray_medal-dev-cp312-cp312-${TARGET}.whl
    cd ..
done
