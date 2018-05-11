#!/bin/sh
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

exec i3

# If we've configured compton, load it as a daemon
# [[ -f ~/.config/compton.conf ]] && compton --config ~/.config/compton.conf -b
