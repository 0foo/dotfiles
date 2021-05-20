#!/bin/bash


function mutant-jekyll() {
  docker run --rm  --volume="$PWD:/srv/jekyll"  -it jekyll/jekyll jekyll $1
}
alias jekyll=mutant-jekyll