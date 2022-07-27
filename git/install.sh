#!/usr/bin/env zsh

set -e

if [[ ! -f "${HOME}/.gitconfig.local" && ! ${REMOTE_CONTAINERS} ]] ; then
  cp "${DOTFILES_LOCATION}/git/.gitconfig.local" "${HOME}/.gitconfig.local"

  echo "Enter your full name";
  read -re var
  sed -i '' "s/GITNAME/${var}/" "${HOME}/.gitconfig.local"

  echo "Enter your email address";
  read -re var
  sed -i '' "s/GITEMAIL/${var}/" "${HOME}/.gitconfig.local"
  else
    # Git credentials
    cat  <<EOF
Enter the following commands to configure git 'user'
git config --global user.name "Doug Morand"
git config --global user.email "me@example.com"
EOF
fi

ln -sf "${DOTFILES_LOCATION}/git/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES_LOCATION}/git/.gitignore" "${HOME}/.gitignore"
