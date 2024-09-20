# overwrite rm to add anything deleted to trashcan!
function rm(){
    echo "adding to $(whoami)'s trash can: ${!#}"
    trash-put $@
}
