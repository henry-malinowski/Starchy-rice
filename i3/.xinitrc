#!/bin/sh
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# set mouse acceleration to 0
#xset m 0 0

# unless it's the track pad
#xinput set-prop "$(xinput --list --name-only | grep -iF "TouchPad")" "libinput Accel Speed" 2.5

# exported for dunst
systemctl --user import-environment DISPLAY
exec i3
