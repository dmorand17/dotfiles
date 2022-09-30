#!/usr/bin/env bash

set -e

ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
  sudo chsh -s $(which zsh)
fi

# Add brew to .zshrc
case "$(uname -s)" in
    Darwin)
        echo 'Mac OS X'
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zshrc"
        ;;
   Linux)
     echo 'Linux' 
     echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "${HOME}/.zshrc"
     ;;
   *)
     echo 'Other OS' 
     ;;
esac
