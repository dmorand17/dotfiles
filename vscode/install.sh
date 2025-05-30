#!/usr/bin/env zsh

set -e

if [ -x "$(command -v code)" ]; then
    os="$(uname -s)"
    case "${os}" in 
        Linux*)
            ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
            ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
            ;;
        Darwin*)
            ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
            ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
            ;;
        *) ;;
    esac

    # Install extensions
    while read -r extension; do
        cursor --install-extension "$extension"
    done < "${DOTFILES_LOCATION}/vscode/extensions"    
fi
