#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/17717/refer-to-a-file-under-the-same-directory-of-a-script-found-in-path


for f in "$HOME/.oresoftware/bash/"*; do echo "$f" && . "$f"; done


