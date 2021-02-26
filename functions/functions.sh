#!/bin/bash

# $1=length, default 10
function mutant-encrypt-random-hash {
  local size
  local out
  [ -z "$1" ] && size=10 || size=$1
  out=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $size ; echo '')
  echo "$out"
}

function mutant-ssh-generate-key {
  local random_num
  random_num="$(mutant-encrypt-random-hash 10)"
  filename="/home/$USER/.ssh/$random_num"
  ssh-keygen -t rsa -b 4096 -f "$filename" -q -N ""
  echo "Key Generated: $random_num and $random_num.pub"
}

 # $1=git message
function mutant-git-push-all {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}


# $1=file
# $2=password
function mutant-encrypt-encrypt-file {
    openssl enc -aes-256-cbc -in $1 -out $1.aes-256  -pass pass:$2
}

# $1=filename in
# $2=filename out
function mutant-encrypt-decrypt-file {
  openssl enc -aes-256-cbc -d -in $1 > $2
}

