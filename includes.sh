# define current directory as root directory
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# Source modules
source "$ROOT_DIR/custom/user_additions.sh"
source "$ROOT_DIR/modules/gui/gui.sh" > /dev/null 
source "$ROOT_DIR/modules/history/history.sh" > /dev/null 
source "$ROOT_DIR/modules/hyperjump/hyperjump.sh" > /dev/null 


