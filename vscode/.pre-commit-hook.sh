#!/bin/bash

# Change to the dotfiles directory
echo "Changing to dotfiles directory"
pushd "vscode" > /dev/null || exit 1

echo "Saving VSCode extensions"
./save_extensions
git add extensions

popd > /dev/null || exit 1
