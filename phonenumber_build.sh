#!/bin/bash -l

cjpm clean
cjpm build
cp -r ./resources/ ./build/phonenumber/
