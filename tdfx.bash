#/bin/bash

# TODO: better display
# TODO: ignore some files / directories
# TODO: differ fixme & todo

# $1 <- error msg
# $2 <- code return
function _error() {
  echo $1 >&2
  exit $2
}



GREP=$(which grep)

if [[ -z $GREP ]]; then
  _error "grep is not installed." 1
fi

function _tdfx() {
  $GREP -Ern "FIXME|TODO" $*
}

_tdfx $*
