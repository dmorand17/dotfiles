#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/ssh/.ssh-agent" "${HOME}/.ssh-agent"

if [[ ! -d "${HOME}/.ssh" ]]; then mkdir "${HOME}/.ssh"; fi
ln -sf "${DOTFILES_LOCATION}/ssh/config" "${HOME}/.ssh/config"
ln -sf "${DOTFILES_LOCATION}/ssh/add-keys" "${HOME}/.ssh/add-keys"
