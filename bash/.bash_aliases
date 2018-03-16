#!/bin/bash
[ -r ~/.bash_profile ] && source ~/.bash_profile

export VISUAL="vim"
export EDITOR="$VISUAL"

alias cats='highlight --style=solarized-dark  --out-format=ansi --tab=4'
alias ls='ls -lhN --color --group-directories-first'
alias sudovim='sudo -E vim'

# set cool PS1 if we're in bash
if [ -n "$BASH" ] ; then
    export PS1="\[\033[38;5;5m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;3m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;5m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]";
fi

# set cool 'PS1' if we're in zsh and no theme is set
if [ -z "$ZSH_THEME" ]; then
    PROMPT="%F{magenta}[%F{red}%n%F{yellow}@%F{green}%m %F{blue}%1~%F{magenta}] %F{red}>%f "
fi

alias ka_urxvt='xrdb -merge ~/.Xdefaults && killall urxvt'
alias lock_wlaw='i3lock-fancy \
    --font "Noto-Serif-Display-Italic" \
    --text "Entry into this system without prior expressed permission is in violation of state and federal law.\n\n \
    
    United States Code, Title 18 § 1030 - Computer Fraud and Abuse Act\n \
    Texas Penal Code, Title 7, Chapter 33 - Offenses Against Property (Computer Crimes)\n\n \
    Violators will be prosecuted"'

# invoke the above command and wait 3.5 seconds before requesting to sleep
alias lock_suspend='lock_wlaw & sleep 3.5 && systemctl suspend'
