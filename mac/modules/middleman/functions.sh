#!/bin/bash

function mutant-middleman-init {
    # init middleman
    docker run --rm -v $(pwd):/app middleman /bin/bash -c "middleman init"

    # build and replace the autoprefixer for clean build
    # https://github.com/middleman/middleman/issues/2463
    source_string="gem 'middleman-autoprefixer', '~> 2.7'"
    dest_string="gem 'middleman-autoprefixer', '~> 3.0'"
    docker run --rm -v $(pwd):/app middleman /bin/bash -c "sed -i \"s/$source_string/$dest_string/\" /app/Gemfile"
}


function mutant-middleman-build {
    docker run --rm -v $(pwd):/app middleman /bin/bash -c "bundle install; middleman build --verbose"
}

function mutant-middleman-serve {
    docker run --rm -p 4567:4567 -v $(pwd):/app middleman /bin/bash  -c "bundle install; middleman serve"
}