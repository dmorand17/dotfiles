#!/usr/bin/env zsh

set -e

os="$(uname -s)"
case "${os}" in 
    Linux*)
        ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
        ;;
    Darwin*)
        ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
        # ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
        ;;
    *) ;;
esac

