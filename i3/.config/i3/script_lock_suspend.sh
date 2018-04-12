#!/bin/sh

if ! [ -x "$(command -v betterlockscreen)" ]; then
    i3-nagbar --type error --message "betterlockscreen is not installed. Cannot lock screen."
    exit 1
else
    mpc pause
    pamixer --mute
    betterlockscreen --suspend
fi
