# this gets the directory of currently executing script
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "$ROOT_DIR/functions/functions-only-posix.sh"
source "$ROOT_DIR/functions/aws/main.sh"
source "$ROOT_DIR/functions/function-dependencies.sh"