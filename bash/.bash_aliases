#!/bin/bash
export VISUAL="vim"
export EDITOR="$VISUAL"

alias ccat='highlight --style=solarized-dark  --out-format=ansi --tab=4'
alias ls='ls -lhN --color --group-directories-first'
alias grep='grep --color=auto'
alias ka_urxvt='xrdb -merge ~/.Xdefaults && killall urxvt'
alias lock_wlaw='sh ~/.config/i3/script_lock.sh'
alias lock_suspend='sh ~/.config/i3/script_lock_suspend.sh'

