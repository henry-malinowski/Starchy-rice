#!/bin/bash
export VISUAL="vim"
export EDITOR="$VISUAL"

alias cats='highlight --out-format=ansi --tab=4'
alias ls='ls -lhN --color --group-directories-first'

# set cool PS1 if we're in bash
if [ -n "$BASH" ] ; then
    export PS1="\[\033[38;5;5m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;3m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\]\[\033[38;5;5m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]";
fi

# set cool 'PS1' if we're in zsh and no theme is set
if [ -z "$ZSH_THEME" ]; then
    PROMPT="%B%F{magenta}[%b%F{red}%n%B%F{yellow}@%b%F{green}%m %F{blue}%1~%B%F{magenta}] %B%F{yellow}>%f%b "
fi

alias ka_urxvt='xrdb -merge ~/.Xdefaults && killall urxvt'
alias lock_wlaw='i3lock-fancy \
    --font "Noto-Serif-Display-Italic" \
    --text "Entry into this system without prior expressed permission is in violation of state and federal law.\n\n \
    
    United States Code, Title 18 § 1030 - Computer Fraud and Abuse Act\n \
    Texas Penal Code, Title 7, Chapter 33 - Offenses Against Property (Computer Crimes)\n\n \
    Violators will be prosecuted"'

# invoke the above command and wait 5 seconds before requesting to sleep
alias sleep_lock='lock_wlaw & sleep 3.5 && systemctl suspend'
