#!/bin/bash

# $1=length, default 10
function mutant-encrypt-random-hash() {
  local size
  local out
  [ -z "$1" ] && size=10 || size=$1
  out=$(
    head /dev/urandom | tr -dc A-Za-z0-9 | head -c $size
    echo ''
  )
  echo "$out"
}

function mutant-ssh-generate-key() {
  local random_num
  random_num="$(mutant-encrypt-random-hash 10)"
  filename="/home/$USER/.ssh/$random_num"
  ssh-keygen -t rsa -b 4096 -f "$filename" -q -N ""
  echo "Key Generated: $random_num and $random_num.pub"
}

# $1=git message
function mutant-git-push-all() {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}

# $1=file
# $2=password
function mutant-encrypt-encrypt-file() {
  openssl enc -aes-256-cbc -in $1 -out $1.aes-256 -pass pass:$2
}

# $1=filename in
# $2=filename out
function mutant-encrypt-decrypt-file() {
  openssl enc -aes-256-cbc -d -in $1 >$2
}

function mutant-is-login-shell() {
  test=echo $0
  echo
}

function mutant-bash-kill-jobs() {
  pids=$(jobs -p)
  ## TBI kill jobs
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
