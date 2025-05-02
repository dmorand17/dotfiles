#!/bin/bash

# Change to the dotfiles directory
echo "Changing to dotfiles directory"
pushd "cursor" > /dev/null || exit 1

echo "Saving Cursor extensions"
./save_extensions

echo "Adding Cursor extensions to git"
git add extensions

popd > /dev/null || exit 1

echo "Done"
