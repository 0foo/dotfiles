 #!/bin/bash

 function mutant-ssh-generate-key {
  local random_num
  random_num="$(mutant-encrypt-random-hash 10)"
  filename="/home/$USER/.ssh/$random_num"
  ssh-keygen -t rsa -b 4096 -f "$filename" -q -N ""
  echo "Key Generated: $random_num and $random_num.pub"
}