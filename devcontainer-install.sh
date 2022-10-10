#!/usr/bin/env bash

set -eou pipefail

###
# Installation of packages, configurations, and dotfiles
###
export DOTFILES_LOCATION=$(pwd)

###
# Install dependencies
###
./bin/dotfiles install zsh
./bin/dotfiles install brew
./bin/dotfiles install git
./bin/dotfiles install vim
./bin/dotfiles install misc
./bin/dotfiles install ssh
