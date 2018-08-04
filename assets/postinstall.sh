#!/usr/bin/env bash


mkdir -p "$HOME/.oresoftware" || {
    echo "Could not create .oresoftware dir in user home.";
    exit 1;
}

cat assets/shell.sh > "$HOME/.oresoftware/shell.sh" || {
  echo "could not create oresoftware/bash/r2g.sh file."
  exit 1;
}
