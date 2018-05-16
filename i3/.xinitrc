#!/bin/sh
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

exec i3
