#!/usr/bin/env zsh

set -e

if [ -x "$(command -v cursor)" ]; then
    os="$(uname -s)"
    case "${os}" in 
        Linux*)
            ln -sf "${DOTFILES_LOCATION}/Cursor/settings.json" "${HOME}/.config/Cursor/User/settings.json"
            ln -sf "${DOTFILES_LOCATION}/Cursor/keybindings.json" "${HOME}/.config/Cursor/User/keybindings.json"
            ;;
        Darwin*)
            ln -sf "${DOTFILES_LOCATION}/Cursor/settings.json" "${HOME}/Library/Application Support/Cursor/User/settings.json"
            ln -sf "${DOTFILES_LOCATION}/Cursor/keybindings.json" "${HOME}/Library/Application Support/Cursor/User/keybindings.json"
            ;;
        *) ;;
    esac

    # Install extensions
    while read -r extension; do
        cursor --install-extension "$extension"
    done < "${DOTFILES_LOCATION}/cursor/extensions"
    echo "Cursor extensions installed!!!"
fi

