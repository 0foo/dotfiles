#!/bin/bash


# define current directory as root directory
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"




# disable git's dubious directory checking
git config --global --add safe.directory '*'