#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17717/refer-to-a-file-under-the-same-directory-of-a-script-found-in-path

my_dir="$(dirname "$(realpath "$0")")"

for f in "$my_dir/bash/"*; do echo "$f" && . "$f"; done


