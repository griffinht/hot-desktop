#ssh user@192.168.0.1

HOST=192.168.0.6
EXTERNAL_ADDRESS=98.21.46.184

cat << EOF
# http with nat hairpin
#https://help.mikrotik.com/docs/display/ROS/NAT#NAT-HairpinNAT
#https://forum.mikrotik.com/viewtopic.php?t=172380
ip firewall nat add action=masquerade chain=srcnat dst-address=$HOST out-interface-list=LAN protocol=tcp src-address=192.168.0.0/24
# nginx
ip firewall nat add chain=dstnat action=dst-nat dst-address=$EXTERNAL_ADDRESS dst-port=80 to-addresses=$HOST protocol=tcp
ip firewall nat add chain=dstnat action=dst-nat dst-address=$EXTERNAL_ADDRESS dst-port=443 to-addresses=$HOST protocol=tcp

# wireguard (on port 123 to circumvent port blocking)
ip firewall nat add chain=dstnat action=dst-nat dst-address=$EXTERNAL_ADDRESS dst-port=3108 to-addresses=$HOST protocol=udp

# minecraft
ip firewall nat add chain=dstnat action=dst-nat dst-address=$EXTERNAL_ADDRESS dst-port=25565 to-addresses=$HOST protocol=tcp


# ip-server
ip firewall nat add chain=dstnat action=dst-nat dst-address=$EXTERNAL_ADDRESS dst-port=38234 to-addresses=$HOST protocol=tcp
EOF

#!/bin/bash

# https://forum.mikrotik.com/viewtopic.php?t=94355
ssh-keygen -if mikrotik_rsa.pub -m PKCS8 | ssh-keygen -lf -

