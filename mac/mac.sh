# this gets the directory of currently executing script
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MODULES_DIR="$ROOT_DIR/../modules"


# customize terminal
source "$ROOT_DIR/terminal-customize.sh"
source "$MODULES_DIR/encrypt/functions.sh"
source "$MODULES_DIR/ssh/functions.sh"
source "$MODULES_DIR/git/functions.sh"
