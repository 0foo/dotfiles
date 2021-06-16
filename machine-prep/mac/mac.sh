#!/bin/bash

# make hidden files visible
defaults write com.apple.Finder AppleShowAllFiles true
Killall Finder

# install homebrew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# packages
brew install the_silver_searcher

# need to update the mac-os bash
brew install bash
sudo bash -c "echo '/usr/local/bin/bash' >> /etc/shells" # note: permissions require doing it this way
chsh -s /usr/local/bin/bash

# bash completion: https://github.com/kubernetes/kubernetes/issues/48575
echo "source $(brew --prefix)/etc/bash_completion" >> ~/.bashrc


# fini
echo "CLOSE THE SHELL AND REOPEN FOR UPDATED BASH SHELL"

