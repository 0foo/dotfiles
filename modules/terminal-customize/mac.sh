#!/bin/bash


# get git branch
function parse_git_branch {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# configure coloring
PS1='\[\033[01;34m\]\w\[\033[01;35m\] $(parse_git_branch)\[\033[01;39m\] : \[\033[01;32m\]'


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# some aliases
alias ls="ls -G"
# some ls aliases
alias ll='ls -aGlF'
alias la='ls -AG'
alias l='ls -CFG'


# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

