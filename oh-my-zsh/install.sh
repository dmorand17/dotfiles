#!/usr/bin/env zsh

set -e

if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [ -d "${HOME}/.zplug" ]; then
  printf "zplug is already installed\n"
else
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/aliases.zsh" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/functions.zsh" "${HOME}/.oh-my-zsh/custom/functions.zsh"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/exports.zsh" "${HOME}/.oh-my-zsh/custom/exports.zsh"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/zplug.zsh" "${HOME}/.zplug.zsh"
