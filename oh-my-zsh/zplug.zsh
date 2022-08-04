source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/kubectl",   from:oh-my-zsh

# Self manage zplug updates
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load themes
zplug 'dracula/zsh', as:theme
#zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 
