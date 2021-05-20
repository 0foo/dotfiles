#!/bin/bash

# $1=length, default 10
function mutant-encrypt-random-hash() {
  docker run --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-random-hash $1"
}

function mutant-ssh-generate-key() {
    docker run -v /Users/$USER/.ssh:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-ssh-generate-key"
}

# $1=file
# $2=password
function mutant-encrypt-encrypt() {
    docker run -v .:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-encrypt $1"
}

# $1=filename in
# $2=filename out
function mutant-encrypt-decrypt() {
    docker run -v $PWD:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-decrypt $1"
}

function mutant-is-login-shell() {
  test=echo $0
  echo
}

function mutant-bash-kill-jobs() {
  pids=$(jobs -p)
  ## TBI kill jobs
}

# $1=git message
function mutant-git-push-all() {
  docker run -v .:/data -v /Users/$USER/.ssh:/root/.ssh --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-git-push-all"
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

function mutant-git-branch-prune() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

function mutant-git-reset-cache() {
  git rm -r --cached .
  git add .
}

function mutant-vpn-connect-personal() {
  cd ~/.vpn
  sudo openvpn --config my-vpn-config.ovpn
}

# via: https://itsfoss.com/restart-network-ubuntu/
# This is a hail mary full network reboot in case the ubuntu networking stack get whacky with no explanation
function mutant-networking-reset-stack() {
  sudo nmcli networking off
  sudo nmcli networking on
  sudo service network-manager restart

  sudo dpkg -s ifupdown >/dev/null 2>&1

  if [ $? -ne 0 ]; then
    sudo apt install -y ifupdown
  fi

  sudo ifdown -a
  sudo ifup -a
}

function mutant-jekyll() {
  docker run --rm  --volume="$PWD:/srv/jekyll"  -it jekyll/jekyll jekyll $1
}
alias jekyll=mutant-jekyll


function mutant-http-server() {
  # python -m SimpleHTTPServer  
  docker run  \
    --rm \
    -it \
    -v $PWD:/data \
    -p 8080:8080 \
    simple-http-server
}


