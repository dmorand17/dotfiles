#!/usr/bin/env bash

set -e

if [[ ! -d "${HOME}/.config ]]; then
  mkdir "${HOME}/.config
fi

ln -sf "${DOTFILES_LOCATION}/starship/starship.toml" "${HOME}/.config/starship.toml"
