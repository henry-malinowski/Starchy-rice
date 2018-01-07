#!/bin/bash
alias ls='ls --color=auto'
alias grep='grep --color=auto'

[ -r ~/.bash_aliases ] && source ~/.bash_aliases
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
