#!/bin/bash
echo "Whats up!"

# $1=aws region $2=aws_account_id
function mutant-city-ecr-authenticate {
  error_msg='Parameters required: $1=region $2=aws_account_id'
  [ -z "$1" ] && echo "$error_msg" && return
  [ -z "$2" ] && echo "$error_msg" && return
  aws ecr get-login-password --region "$1" | docker login --username "AWS" --password-stdin "$2.dkr.ecr.$1.amazonaws.com"
  true;
}
# $1=image id $2=account_id $3=region $4=name of ecr repo
function mutant-city-ecr-push {
  error_msg='Parameters required: $1=image id $2=account_id $3=region $4=name of ecr repo'
  [ -z "$1" ] && echo "$error_msg" && return
  [ -z "$2" ] && echo "$error_msg" && return
  [ -z "$3" ] && echo "$error_msg" && return
  [ -z "$4" ] && echo "$error_msg" && return

  aws ecr create-repository \
    --repository-name "$4" \
    --image-scanning-configuration scanOnPush=true \
    --region "$3"

  url="$2.dkr.ecr.$3.amazonaws.com/$4"
  docker tag $1 $url
  docker push $url
}

# $1=length, default 10
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

# $1=git message
function mutant-city-git-push-all {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}



