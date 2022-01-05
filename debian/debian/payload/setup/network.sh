#!/bin/bash

ADDRESS="$1"
if [ -z "$ADDRESS" ]; then
  echo "ADDRESS not specified"
  exit 1
fi;

cat << EOF > /etc/network/interfaces
# setup/setup/network.sh
#
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp4s0
iface enp4s0 inet static
    address $ADDRESS
    netmask 255.255.254.0
    gateway 192.168.0.1
EOF

systemctl restart networking