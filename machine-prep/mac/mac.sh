#!/bin/bash

# make hidden files visible
defaults write com.apple.Finder AppleShowAllFiles true
Killall Finder

# install homebrew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


