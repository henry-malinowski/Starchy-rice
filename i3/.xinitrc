#!/bin/sh
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

systemctl --user import-environment DISPLAY
exec i3
