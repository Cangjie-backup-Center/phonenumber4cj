#!/bin/bash -l

cjpm clean
cjpm build
# cjpm build --coverage
cp -r ./resources/ ./build/release/phonenumber4cj/
