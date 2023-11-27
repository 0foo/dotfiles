# clear history for good!
# https://askubuntu.com/questions/191999/how-to-clear-bash-history-completely
nick_clear_history () {
   cat /dev/null > ~/.bash_history && history -c
}
alias nick_clear_history=nick_clear_history



## SHARE HISTORY BETWEEN TERMINALS
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000