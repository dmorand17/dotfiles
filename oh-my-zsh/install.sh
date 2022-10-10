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

ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/.aliases" "${HOME}/.aliases"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/.functions" "${HOME}/.functions"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/.exports" "${HOME}/.exports"
ln -sf "${DOTFILES_LOCATION}/oh-my-zsh/zplug.zsh" "${HOME}/.zplug.zsh"
