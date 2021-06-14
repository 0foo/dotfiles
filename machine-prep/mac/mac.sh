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
sudo bash -c "echo '/usr/local/bin/bash' >> /etc/shells"
chsh -s /usr/local/bin/bash
echo "CLOSE THE SHELL AND REOPEN FOR UPDATED BASH SHELL"

