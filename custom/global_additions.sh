# quick git function to dump something to git remote
function git_go() {
   git add . && git commit -m "save state" && git push;
}

alias git_go=git_go