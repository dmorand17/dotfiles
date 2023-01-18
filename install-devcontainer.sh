#!/usr/bin/env bash

set -eo pipefail

###
# Installation of packages, configurations, and dotfiles
###
export DOTFILES_LOCATION=$(pwd)

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
    echo "Not inside a dev container!  Please try again."
    exit 1 
fi

###
# Install dependencies
###
./bin/dotfiles install zsh
./bin/dotfiles install vim
