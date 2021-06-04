# Source this from login file like .bashrc or .profile.

# this gets the directory of currently executing script
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$ROOT_DIR/modules/terminal-customize/mac.sh"
source "$ROOT_DIR/modules/git/functions.sh"
source "$ROOT_DIR/modules/git/git-auto-complete.bash"
source "$ROOT_DIR/modules/encrypt/functions.sh"
source "$ROOT_DIR/modules/ssh/functions.sh"
source "$ROOT_DIR/modules/jekyll/functions.sh"
source "$ROOT_DIR/modules/simple-http-server/functions.sh"
source "$ROOT_DIR/modules/labkey/functions.sh"

