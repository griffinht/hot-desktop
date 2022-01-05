#!/bin/bash

ADDRESS="$1"
if [ -z "$ADDRESS" ]; then
  echo "ADDRESS not specified"
  exit 1
fi;

./setup/system.sh
./setup/users.sh
./setup/openssh-server.sh
./setup/network.sh "$ADDRESS"