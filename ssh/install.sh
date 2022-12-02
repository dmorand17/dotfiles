#!/usr/bin/env zsh

set -e

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
    ln -sf "${DOTFILES_LOCATION}/ssh/.ssh-agent" "${HOME}/.ssh-agent"
fi

if [[ ! -d "${HOME}/.ssh" ]]; then mkdir "${HOME}/.ssh"; fi
ln -sf "${DOTFILES_LOCATION}/ssh/config" "${HOME}/.ssh/config"
ln -sf "${DOTFILES_LOCATION}/ssh/add-keys" "${HOME}/.ssh/add-keys"
touch ${HOME}/.ssh/config-local
touch ${HOME}/.ssh/add-keys-local
