#!/bin/bash

# Generate translations for certain files such as polkit
pushd "${PWD}"/po
make
make clean
popd

# Update the autovala environment
export AUTOVALA_CMAKE_SCRIPT="${PWD}"/autovala/cmake
autovala refresh
autovala cmake
cp "${PWD}"/autovala/configure "${PWD}"/configure
cp "${PWD}"/autovala/configure-custom.sh "${PWD}"/.configure-custom.sh
