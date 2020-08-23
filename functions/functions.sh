#!/bin/bash
echo "Whats up!"

function ecr-push {
  true;
}

function mutant-city-generate-random-hash {
  local size
  local out
  [ -z "$1" ] && size=10 || size=$1
  out=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c $size ; echo '')
  echo "$out"
}

function mutant-city-generate-ssh-key {
  local random_num
  random_num="$(mutant-city-generate-random-hash 10)"
  filename="/home/$USER/.ssh/$random_num"
  ssh-keygen -t rsa -b 4096 -f "$filename" -q -N ""
  echo "Key Generated: $random_num and $random_num.pub"
}

function mutant-city-git-push-all {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}





