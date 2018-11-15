#!/bin/sh

if ! [ -x "$(command -v betterlockscreen)" ]; then
    i3-nagbar --type error --message "betterlockscreen is not installed. Cannot lock screen."
    exit 1
else
    # don't play music in the background
    mpc pause
    pamixer --mute

    # make sure we aren't locked out because the language is not set to English
    xkb-switch -s us

    # lock proper
    betterlockscreen --$1
fi
