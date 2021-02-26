# aws cli - https://aws.amazon.com/cli/
# hyperjump - add to /etc/profile.d - https://github.com/x0054/hyperjump
# keychain - https://www.funtoo.org/Keychain


# SSH 
# On systems with only one user to share ssh keys with root, can create a group and create a directory in /etc/ssh, and then symlink that directory as the .ssh folder for 
#   main user and root, be sure to reboot after adding to the group!


# add keys to keychain
# requires keychain dependency
# https://www.funtoo.org/Keychain
function mutant-keychain-ssh-add-keys {
  KEYS=$(find $HOME/.ssh/* -maxdepth 1 -type f -not -name '*.pub' -type f -not -name 'known_hosts' -not -name 'config')
  eval `keychain --eval --agents ssh $KEYS`
}


