# define current directory as root directory
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# quick git function to dump something to git remote
function git_go() {
   git add . && git commit -m "save state" && git push;
}
alias git_go=git_go

# generate ssh key per github specs
function git_ssh_key_generate () {
   ssh-keygen -t ed25519
}
alias git_ssh_key_generate=git_ssh_key_generate

# add sshkey file to ssh agent
function ssh_add_keyfile(){
   eval "$(ssh-agent -s)"
   ssh-add $1
}
alias ssh_add_keyfile=ssh_add_keyfile

function http_status_codes {
   /bin/bash "$ROOT_DIR/modules/general/http_status_codes.sh"
}
alias http_status_codes=http_status_codes

# clear history for good!
# https://askubuntu.com/questions/191999/how-to-clear-bash-history-completely
wipe_history_full () {
   cat /dev/null > ~/.bash_history && history -c
}

alias wipe_history_full=wipe_history_full