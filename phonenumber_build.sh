#!/bin/bash -l

cjpm clean
cjpm build
# cjpm build --coverage
cp -r ./resources/ ./target/release/phonenumber4cj/
