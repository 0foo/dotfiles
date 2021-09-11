#!/bin/bash

# enter a docker container
# $1=image or container id
function mutant-docker-bin-bash {

  docker run -it $1 /bin/bash
  if [ $? -eq 0 ]; then
      exit
  fi

  docker run -it --entrypoint /bin/bash $1
  if [ $? -eq 0 ]; then
      exit
  fi

  docker exec -it $1 /bin/bash
}