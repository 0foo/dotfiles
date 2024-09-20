# display history with time
export HISTTIMEFORMAT="%m/%d/%Y[%T] "

## SHARE HISTORY BETWEEN TERMINALS
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it

# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}"
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# trap 'history -a; history -c; history -r' DEBUG


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000



function history() {
    if [ $# -eq 0 ]; then
        # No arguments, apply custom formatting
        command history | awk '{$1=""; print substr($0,2)}'
    else
        # Arguments present, run the built-in history command with the arguments
        command history "$@"
    fi
}


