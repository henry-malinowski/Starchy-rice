#!/bin/bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc is it exists
    if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
    fi
fi

