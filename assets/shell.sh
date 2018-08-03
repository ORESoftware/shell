#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17717/refer-to-a-file-under-the-same-directory-of-a-script-found-in-path

export ores_gray='\033[1;30m'
export ores_magenta='\033[1;35m'
export ores_cyan='\033[1;36m'
export ores_orange='\033[1;33m'
export ores_green='\033[1;32m'
export ores_no_color='\033[0m'

### load/source all adjacent shell scripts

ores_shell_re_source(){
  for f in "$HOME/.oresoftware/bash/"*; do

      if [ "$oresoftware_env" == "local" ]; then
            echo "$f";
      fi

      . "$f";  # source it
  done
}

ores_shell_re_source # run it

ores_shell_ls(){
  ls "$HOME/.oresoftware/bash";
}

export -f ores_shell_re_source;
export -f ores_shell_ls;
