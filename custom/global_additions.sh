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