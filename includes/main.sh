# define current directory as root directory
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$ROOT_DIR/gui.sh"
source "$ROOT_DIR/history.sh"


# create a directory and add to CD path
# any symlinks in this directory will be short cuts
# mkdir ~/bash_shortcuts
# ln -s /usr/bin ~/symlinks/b
# cd b   # Switches to /usr/bin
# # https://unix.stackexchange.com/questions/1469/bash-directory-shortcuts
test -d ~/bash_shortcuts && export CDPATH=~/bash_shortcuts;



function git_go() {
   git add . && git commit -m "save state" && git push;
}


