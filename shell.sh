#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17717/refer-to-a-file-under-the-same-directory-of-a-script-found-in-path

my_dir="$(dirname "$(realpath "$0")")"


DIRN="$(dirname "$0")"
RL="$(readlink "$0")";
EXECDIR="$(dirname $(dirname "$RL"))";
MYPATH="$DIRN/$EXECDIR";
X="$(cd $(dirname ${MYPATH}) && pwd)/$(basename ${MYPATH})"

echo "xxx => $X"

for f in "$X/bash/"*; do echo "$f" && . "$f"; done


