#!/usr/bin/env bash

set -eou pipefail

###
# Installation of packages, configurations, and dotfiles
###
export DOTFILES_LOCATION=$(pwd)

###
# Install dependencies
###
./bin/dotfiles install oh-my-zsh
./bin/dotfiles install zsh
./bin/dotfiles install brew
./bin/dotfiles install git
./bin/dotfiles install vim
./bin/dotfiles install misc
./bin/dotfiles install ssh

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
	./bin/dotfiles install starship
	./bin/dotfiles install vscode
fi