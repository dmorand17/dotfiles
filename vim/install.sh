#!/usr/bin/env zsh

set -e

[ -d "${HOME}/.vim" ] || mkdir "${HOME}/.vim"
[ -d "${HOME}/.vim/swaps" ] || mkdir "${HOME}/.vim/swaps"
[ -d "${HOME}/.vim/backups" ] || mkdir "${HOME}/.vim/backups"
ln -sf "${DOTFILES_LOCATION}/vim/.vimrc" "${HOME}/.vimrc"
