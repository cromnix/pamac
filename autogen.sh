#!/bin/bash

# Generate translations for certain files such as polkit
pushd "${PWD}"/po
./populate_LINGUAS_file.sh
./create_pot_file.sh
./update_po_files.sh
make
make clean
popd

# Update the autovala environment
autovala update
