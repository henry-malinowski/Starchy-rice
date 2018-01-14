#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3

# starts urxvt as a daemon
urxvtd -q -f -o &

# If we've configured compton, load it as a daemon
[[ -f ~/.config/compton.conf ]] && compton --config ~/.config/compton.conf -b
