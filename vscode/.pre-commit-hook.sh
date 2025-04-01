#!/bin/bash

# Change to the dotfiles directory
pushd "$DOTFILES_LOCATION/vscode" > /dev/null || exit 1

save_extensions
git add code_extensions

popd > /dev/null || exit 1
