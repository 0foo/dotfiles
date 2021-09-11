#!/bin/bash

# $1=aws region $2=aws_account_id
function mutant-aws-ecr-authenticate {
  error_msg='Parameters required: $1=region $2=aws_account_id'
  [ -z "$1" ] && echo "$error_msg" && return
  [ -z "$2" ] && echo "$error_msg" && return
  aws ecr get-login-password --region "$1" | docker login --username "AWS" --password-stdin "$2.dkr.ecr.$1.amazonaws.com"
  true;
}
# $1=image id $2=account_id $3=region $4=name of ecr repo
function mutant-aws-ecr-push {
  error_msg='Parameters required: $1=image id $2=account_id $3=region $4=name of ecr repo'
  [ -z "$1" ] && echo "$error_msg" && return
  [ -z "$2" ] && echo "$error_msg" && return
  [ -z "$3" ] && echo "$error_msg" && return
  [ -z "$4" ] && echo "$error_msg" && return

  aws ecr create-repository --repository-name "$4" --image-scanning-configuration scanOnPush=true --region "$3"
  wait $!
  url="$2.dkr.ecr.$3.amazonaws.com/$4"
  docker tag $1 $url
  docker push $url
}