1. put this repo somewhere global 
    * i.e. `/opt/dotfiles`
2. configure permissions to this directory depending on your needs
    * 777 is easiest but least secure 
    * A group for this is most secure
3. add global functionality
    * inside of /bash/bash.bashrc add a source command to global_additions
    * i.e. `source /opt/dotfiles/custom/global_additions.sh`
4. add user specific functionality
    * source the includes file from each user account you want to add this to: `source /opt/dotfiles/includes.sh`
    * and/or can source files from individual modules