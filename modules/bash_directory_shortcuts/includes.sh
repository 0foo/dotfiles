# create a directory and add to CD path
# any symlinks in this directory will be short cuts
# mkdir ~/bash_shortcuts
# ln -s /usr/bin ~/symlinks/b
# cd b   # Switches to /usr/bin


# # https://unix.stackexchange.com/questions/1469/bash-directory-shortcuts
# this is one option for saving quick links to directories

# I started to dislike this as it registers the $(pwd) as the bash_shortcuts directory

test -d ~/bash_shortcuts && export CDPATH=~/bash_shortcuts;

this is for bookmarking
function bmark(){
	test -z "$1" && return 1;
	ln -s $(pwd) ~/bash_shortcuts/$1
}


