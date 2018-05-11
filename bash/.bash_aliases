#!/bin/bash

export VISUAL="vim"
export EDITOR="$VISUAL"

alias cats='highlight --style=solarized-dark  --out-format=ansi --tab=4'
alias ls='ls -lhN --color --group-directories-first'
alias sudovim='sudo -E vim'
alias grep='grep --color=auto'

# set cool 'PS1' if we're in zsh and no theme is set
if [ -z "$ZSH_THEME" ]; then
    PROMPT="%F{magenta}[%F{red}%n%F{yellow}@%F{green}%m %F{blue}%1~%F{magenta}] %F{red}>%f "
fi

alias ka_urxvt='xrdb -merge ~/.Xdefaults && killall urxvt'
alias lock_wlaw='sh ~/.config/i3/script_lock.sh'
alias lock_suspend='sh ~/.config/i3/script_lock_suspend.sh'

