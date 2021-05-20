# via: https://itsfoss.com/restart-network-ubuntu/
# This is a hail mary full network reboot in case the ubuntu networking stack get whacky with no explanation
function mutant-networking-reset-stack() {
  sudo nmcli networking off
  sudo nmcli networking on
  sudo service network-manager restart

  sudo dpkg -s ifupdown >/dev/null 2>&1

  if [ $? -ne 0 ]; then
    sudo apt install -y ifupdown
  fi

  sudo ifdown -a
  sudo ifup -a
}