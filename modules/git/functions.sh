#!/bin/bash

# figure out how to make this source from this directory 
# source ./git-auto-complete.bash

# $1=git message
function mutant-git-push-all() {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}

function mutant-git-branch-prune() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

function mutant-git-reset-cache() {
  git rm -r --cached .
  git add .
}

# this will delete git branches that aren't on the remote
# Note: Spend more time researching this.
function mutant-git-branch-prune-nonremote() {
  # clean unused remote references
  git remote prune origin

  # clean merged branches
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d

  # delete local branches not on remote
  git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}

echo "git module loaded"
