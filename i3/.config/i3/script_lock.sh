#!/bin/sh

if ! [ -x "$(command -v betterlockscreen)" ]; then
    i3-nagbar --type error --message "betterlockscreen is not installed. Cannot lock screen."
    exit 1
else
    # don't play music in the background
    mpc pause
    pamixer --mute

    # make sure we aren't locked out because the language is not set to English
    setxkbmap us
    setxkbmap -layout us,ru
    betterlockscreen --lock
    exit 0
fi
