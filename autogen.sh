#!/bin/bash

# Generate translations for certain files such as polkit
pushd "${PWD}"/po
make
make clean
popd

# Update the autovala environment
autovala update
