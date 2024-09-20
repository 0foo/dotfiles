
function http_status_codes {
   /bin/bash "$ROOT_DIR/http_status_codes.sh"
}

alias http_status_codes=http_status_codes

# clear history for good!
# https://askubuntu.com/questions/191999/how-to-clear-bash-history-completely
wipe_history_full () {
   cat /dev/null > ~/.bash_history && history -c
}

alias wipe_history_full=wipe_history_full


