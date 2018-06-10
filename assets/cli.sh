#!/usr/bin/env bash


dir_name="$(dirname "$0")"
read_link="$(readlink "$0")";
exec_dir="$(dirname $(dirname "$read_link"))";
my_path="$dir_name/$exec_dir";
project_root="$(cd $(dirname ${my_path}) && pwd)/$(basename ${my_path})"
assets="$project_root/assets"


mkdir -p "$HOME/.oresoftware" || {
  echo "could not create '$HOME/.oresoftware'";
  exit 1;
}

github_url_master="https://raw.githubusercontent.com/oresoftware/shell/master"

(

    shell_file="$assets/shell.sh";
    [ -f "$shell_file" ] && cat "$shell_file" > "$HOME/.oresoftware/shell.sh" && {
        echo "Successfully copied @oresoftware/shell/assets/shell.sh to $HOME/.oresoftware/shell.sh";
        exit 0;
    }

    curl -H 'Cache-Control: no-cache' "$github_url_master/assets/shell.sh?$(date +%s)" \
          --output "$HOME/.oresoftware/shell.sh" 2> /dev/null || {
           echo "curl command failed to read shell.sh";
           exit 1;
    }
)


mkdir -p "$HOME/.oresoftware/execs" || {
    echo "could not create execs directory in $HOME/oresoftware.";
}


mkdir -p "$HOME/.oresoftware/bash" || {
    echo "could not mkdir '$HOME/.oresoftware/bash'" >&2;
    exit 1;
}


mkdir -p "$HOME/.oresoftware/nodejs/node_modules" ||{
  echo "could not create complete dir path in user home." >&2;
  exit 1;
}


(

    if [ -f "$HOME/.oresoftware/nodejs/package.json" ]; then
       exit 0;
    fi

    json_file="$assets/package.json";

    [ -f "$json_file" ] && cat "$json_file" > "$HOME/.oresoftware/nodejs/package.json" && {
       echo "Successfully copied @oresoftware/shell/assets/package.json to $HOME/.oresoftware/nodejs/package.json";
       exit 0;
    }

    curl -H 'Cache-Control: no-cache' "$github_url_master/assets/package.json?$(date +%s)" \
            --output "$HOME/.oresoftware/nodejs/package.json" 2> /dev/null  && {

       echo "Successfully copied package.json file from Github repo.";
       exit 0;
    }

     echo "curl command failed to read package.json, now we should try wget..." >&2
     exit 1;

)
