#!/usr/bin/env zsh

set -e

if [ -x "$(command -v brew)" ]; then
  printf "\n✅ SUCCESS: brew already installed\n"
elif [[ $(arch) = "arm64" ]]; then
  printf "\n⛔ FAIL: Unable to install brew on arm64\n"
else
  printf "\n🚀 Installing the brew package manager\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

###
# Make sure we’re using the latest Homebrew and upgrade any installed formulaes
###
brew update && brew upgrade

###
# Save Homebrew’s installed location.
###
BREW_PREFIX=$(brew --prefix)

###
# Install brew packages
###
printf "\n🚀 Installing brew packages\n"
# Arm
BREW_PACKAGES=(
  fzf
  bat
  jq
  yq
  nvm
  ripgrep
  pyenv
  starship
  yarn
  tree
  k9s
  kubectl
)

for pkg in "${BREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && brew install "${pkg}"; done

# setup fzf
if [[ ! -f ~/.fzf.zsh ]]; then
    $(brew --prefix)/opt/fzf/install
fi

case "$(uname -s)" in
    Darwin)
        echo 'Mac OS X'
        # Casks
        brew tap homebrew/cask-fonts

        BREW_CASK_PACKAGES=(
        font-fira-code
        font-fira-code-nerd-font
        font-fira-mono-nerd-font
        )

        for pkg in "${BREW_CASK_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && brew install --cask "${pkg}"; done
        ;;
   Linux)
     echo 'Linux'
     ;;
   *)
     echo 'Other OS' 
     ;;
esac

# Some tidying up
brew autoremove -v
brew cleanup --prune=all
