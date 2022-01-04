#!/bin/bash

ADDRESS="$1"
if [ -z "$ADDRESS" ]; then
  echo "ADDRESS not specified"
  exit 1
fi;

/hot-desktop/setup/system.sh
/hot-desktop/setup/users.sh
/hot-desktop/setup/openssh-server.sh
/hot-desktop/setup/network.sh "$ADDRESS"