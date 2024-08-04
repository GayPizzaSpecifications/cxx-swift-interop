#!/bin/sh
set -e

brew install cmake
rm -rf xcode-main/ci_scripts
cmake -B .. ../..
