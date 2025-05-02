#!/usr/bin/env zsh

set -e

mkdir -p ${HOME}/.config/zed/
ln -sf "${PWD}/zed/settings.json" "${HOME}/.config/zed/settings.json"
