#!/bin/bash

sudo apt install keychain -y

# add keys to keychain
cat << 'delimiter' >> ~/.bashrc
# keychain
KEYS=$(find $HOME/.ssh/* -maxdepth 1 -type f -not -name '*.pub' -type f -not -name 'known_hosts' -not -name 'config' -not -name 'authorized_keys')
eval `keychain --eval --agents ssh $KEYS`
delimiter


