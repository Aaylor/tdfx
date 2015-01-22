#/bin/bash

# TODO: iterating over files instead of cat them all in the same tme.
# TODO: add CLI parser (ignore, fixme, todo, ...)
# TODO: better display

# $1 <- error msg
# $2 <- code return
function _error() {
  echo $1 >&2
  exit $2
}

CAT=$(which cat)
SED=$(which sed)
if [[ -z $CAT ]]; then
  _error "cat is not installed." 1
fi
if [[ -z $SED ]]; then
  _error "sed is not installed." 1
fi

USAGE=<<-EOF
  TDFX helper.
  WIP
EOF

function _tdfx() {
  # FIXME: iterate here.
  $CAT -n $* | $SED '/\/\\*/,/\\*\//{H;d;};x;/TODO/!d'
}

_tdfx $*
