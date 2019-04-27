#!/usr/bin/zsh
export VISUAL="nvim"
export EDITOR="$VISUAL"
export BROWSER="chromium"

# Start: History stuff, first make sure ~/.cache/zsh exists before we start
[[ ! -d "$HOME/.cache/zsh" ]] && mkdir -p "$HOME/.cache/zsh"
HISTFILE=$HOME/.cache/zsh/.zsh_history
HISTSIZE=8192
SAVEHIST=512
# End: History setup

# make sure zsh doesn't use a confusing vi mode
bindkey -e

# Start Antigen setup if Antigen is installed; else implicit fallthrough
# ANTIGEN_INIT doesn't HAVE TO exists at this location; it can be a symlink
ANTIGEN_INIT="$HOME/.config/antigen/antigen.zsh"
if [ -s $ANTIGEN_INIT ]; then
    # move the antigen cache to ~/.cache and create directory if needed
    export ADOTDIR="$HOME/.cache/antigen"
    [[ ! -d $ADOTDIR ]] && mkdir -p $ADOTDIR

    # run the setup 'proper' 
    source $ANTIGEN_INIT
    antigen init "$HOME/.config/antigen/.antigenrc"
fi

# Options set below Antigen loading because Antigen is overriding AUTO_CD
setopt appendhistory beep extendedglob notify
unsetopt AUTO_CD

# Start: completions cache
autoload -Uz promptinit compinit
promptinit
compinit
zstyle ':comletion:*' menu select
zstyle ':comletion:*' rehash true
# End: completions cache

# set cool 'PS1' if we're in zsh and no theme is set, for some reason this has to be after ANTIGEN loading
if [ -z "$ZSH_THEME" ]; then
    # root has a sligtly different prompt so we don't forget the power it holds
    if [ "$(id -u)" -ne "0" ]; then
        PROMPT="%F{magenta}[%F{red}%n%F{yellow}@%F{green}%m %F{blue}%1~%F{magenta}] %F{red}>%f "
    else
        PROMPT="%F{magenta}[%F{red}ROOT%F{yellow}@%F{green}%m %F{blue}%1~%F{magenta}] %F{red}#%f "
    fi
    ZSH_THEME="Starchy_zsh"
fi

# set neovim as our man pager if it is installed
[[ -x "$(command -v nvim)" ]] && export MANPAGER="nvim +set\ filetype=man -"

# Loading generic colouriser
# The first is used by Arch Linux, Debian, and probably most distros.
# The second is used by Void Linux ¯\_(ツ)_/¯
declare -a grc_init=(
    "/etc/grc.zsh"
    "/usr/share/grc/grc.zsh"
)
for _init in ${grc_init[@]}; do
    if [[ -a "$_init" ]]; then
        source "$_init"
        break
    fi
done
unset grc_init

# manually setup dir_colors because the plugin is bugged
# It (incorrectly) assumes that $HOME is $ZDOTDIR; this is only true by default
if [ -f "$ZDOTDIR/.dir_colors" ]; then
    eval "$(dircolors $ZDOTDIR/.dir_colors)"
fi

# load aliases after GRC to override it. Specifically `ls` because our's is cooler
source ${ZDOTDIR}/zsh_aliases
