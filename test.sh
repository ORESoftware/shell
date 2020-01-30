#!/usr/bin/env bash

all_interos_export="yep";

if [[ ! "$SHELLOPTS" =~ "allexport" ]]; then
    all_interos_export="nope";
    set -a;  # we export every declared function using this flag
fi

cm_test_123(){
  echo "1234"
}

cm_goto_api(){
  cd "$GOPATH/src/github.com/channelmeter/cm-go-api"
}

cm_goto_geard(){
  cd "$GOPATH/src/github.com/channelmeter/geard"
}

cm_goto_web(){
  cd "$GOPATH/src/github.com/channelmeter"
}

cm_get_host(){
  echo "GET_CM_HOST" | nc localhost 2009
}

cm_run_host(){
  if [[ -z "$1" ]]; then
     echo 'First argument must be name of host.'
      return 1
  fi

  CM_HOST="$1" node bin/www
}

cm_change_host(){
  if [[ -z "$1" ]]; then
     echo 'First argument must be name of host.'
     return 1
  fi
  echo "CM_HOST:$1" | nc localhost 2009
}


cm_run_webpack_dev(){
  webpack --config 'webpack.config.dev.js' --progress --colors --watch -d
}


if [[ "$all_interos_export" == "nope" ]]; then
  set +a;
fi
