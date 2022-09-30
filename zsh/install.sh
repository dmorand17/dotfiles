#!/usr/bin/env bash

set -e

ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
  sudo chsh -s $(which zsh)
fi
