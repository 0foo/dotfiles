# see: https://github.com/Tib3rius/AutoRecon/blob/master/Dockerfile#L3
function mutant-autorecon-run(){
  sudo docker run -it -v /root/results:/results --rm --name autorecon-container tib3rius/autorecon
}