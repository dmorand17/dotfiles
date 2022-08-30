export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history

# Path
if [ "$(arch)" = "arm64" ]; then
  export PATH=$HOME/.local/bin:/opt/homebrew/bin:$PATH
else
  export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
fi

# virtualenvwrapper
if [[ -f /usr/local/bin/virtualenv ]]; then
    export WORKON_HOME=$HOME/.virtualenvs   # Optional
    export PROJECT_HOME=$HOME/development     # Optional
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi
