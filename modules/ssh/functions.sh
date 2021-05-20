#!/bin/bash

function mutant-ssh-generate-key() {
    docker run -v /Users/$USER/.ssh:/data --rm -it mutant-city /bin/bash -c "source /root/functions.sh && mutant-ssh-generate-key"
}
