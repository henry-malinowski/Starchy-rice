#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3

# If we've configured compton, load it as a daemon
[[ -f ~/.config/compton.conf ]] && compton --config ~/.config/compton.conf -b
