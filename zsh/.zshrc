# Work around to get shell integration to work in Cline
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"


# Amazon Q pre block. Keep at the top of this file.
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_DISABLE_COMPFIX=true

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


source $ZSH/oh-my-zsh.sh

# User configuration

# If not using zplug then load plugins using standard approach
if [[ -f ~/.zplug.zsh ]]; then
  # Load zplug
  source ~/.zplug.zsh
  else
    # Apple Silicon
    if [ $(arch) = "arm64" ]; then
      plugins=(git fzf kubectl golang python zsh-syntax-highlighting zsh-autosuggestions)
    else
      # VS Code Containers
      if [[ ${REMOTE_CONTAINERS} ]] ; then
        plugins=(git fzf python golang zsh-syntax-highlighting zsh-autosuggestions)
      else
        plugins=(git fzf zsh-syntax-highlighting zsh-autosuggestions)
      fi
    fi
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

DEFAULT_USER="$USER"

# Theme
export BAT_THEME="Catppuccin Macchiato"

# Load brew
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# Load starship (except on devcontainer)
if [[ ! ${REMOTE_CONTAINERS} ]] ; then
  eval "$(starship init zsh)"
fi

# nvm
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  
fi

# Source the ssh agent if found
if [ -f ~/.ssh-agent ]; then . ~/.ssh-agent; fi

# Source fzf if installed
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='
      --bind="f2:toggle-preview,tab:execute(less {})"
      --preview "bat --style=numbers --color=always --line-range :500 {}"
      --preview-window=right:60%:hidden'
fi

# Source any custom *.local files
for file in ~/.{aliases,functions,exports}; do
    # if file has read permissions and exists then source file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";

  # Allow for local version overrides
  local="${file}.local"
	# if file has read permissions and exists then source file
	[ -r "$local" ]  && [ -f "$local" ] && source "$local";
done;
unset file;

# Source extra config
[[ -f ~/.extra ]] && source ~/.extra

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export PATH=$PATH:$HOME/.toolbox/bin

export ZED_AWS_PROFILE=ai-profile # name of my ada profile
export ZED_AWS_REGION=us-east-1

# Amazon Q post block. Keep at the bottom of this file.
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
fi
