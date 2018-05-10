#!/bin/bash
export PS1="\[\033[38;5;5m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;3m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;5m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]";

if [ -f "$HOME/.dir_colors" ]; then
    eval `dircolors $HOME/.dir_colors`
fi

[ -r ~/.bash_aliases ] && source ~/.bash_aliases
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
