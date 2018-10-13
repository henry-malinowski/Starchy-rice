#!/bin/zsh
if [[ -z $DISPLAY ]] && (( $EUID != 0 )) {
    [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} == 1 )) &&
        exec startx 1>~/.log/xsession.log 2>&1
}
