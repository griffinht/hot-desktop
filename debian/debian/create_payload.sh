#!/bin/bash

HOST="$1"
if [ -z "$HOST" ]; then
  echo "HOST not specified"
  exit 1
fi;

ADDRESS="$2"
if [ -z "$ADDRESS" ]; then
  echo "ADDRESS not specified"
  exit 1
fi;

INTERFACE="$3"
if [ -z "$INTERFACE" ]; then
  echo "INTERFACE not specified"
  exit 1
fi;

rm -rf html
mkdir html

cp preseed html/preseed





cd html || exit

cat << EOF >> preseed
d-i preseed/late_command string apt-install curl; in-target bash -c "\$(curl $HOST/http.sh)";
EOF

cat << EOF > http.sh
set -e

function http {
  cd "\$(mktemp -d)"
  curl "$HOST"/payload.tar | tar -x
  (
  cd payload
  ./setup.sh "$ADDRESS" "$INTERFACE"
  )
}

http
EOF
