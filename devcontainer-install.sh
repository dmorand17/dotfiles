#!/usr/bin/env bash

set -eo pipefail

###
# Installation of packages, configurations, and dotfiles
###
export DOTFILES_LOCATION=$(pwd)

if [[ ! ${REMOTE_CONTAINERS} ]] ; then
    echo "\🚨🚨🚨 $REMOTE_CONTAINERS is not set! 🚨🚨🚨"
    exit 1 
fi

###
# Install dependencies
###
./bin/dotfiles install zsh
./bin/dotfiles install vim
