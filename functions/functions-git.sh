 #!/bin/bash

 # $1=git message
function mutant-git-push-all {
  [ -z "$1" ] && message="Update" || message=$1
  git add .
  git commit -m $message
  git push
}