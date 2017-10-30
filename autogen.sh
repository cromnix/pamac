#!/bin/bash

# Generate translations for certain files such as polkit
pushd "${PWD}"/po
./create_pot_file.sh
./update_po_files.sh
make
make clean
popd

# Update the autovala project file
autovala refresh
# Remove unused folders and files made by autovala
rm -rf ./{install,packages,doc} ./data/{local,bash_completion} ./.hgignore ./.bzrignore
# Generate the cmake and meson build files
autovala cmake
autovala meson
