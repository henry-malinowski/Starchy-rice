#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3

# starts urxvt as a daemon
urxvtd --open-display --fork

# If we've configured compton, load it as a daemon
[[ -f ~/.config/compton.conf ]] && compton --config ~/.config/compton.conf -b
