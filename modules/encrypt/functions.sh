# $1=length, default 10
function mutant-encrypt-random-hash() {
  docker run --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-random-hash $1"
}

# $1=file
# $2=password
function mutant-encrypt-encrypt() {
    docker run -v $PWD:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-encrypt $1"
}

# $1=filename in
# $2=filename out
function mutant-encrypt-decrypt() {
    docker run -v $PWD:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-encrypt-decrypt $1"
}

echo "encrypt module loaded"
