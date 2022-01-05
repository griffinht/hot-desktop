#!/bin/bash

apt-get install -y openssh-server
cat << EOF > /etc/ssh/sshd_config.d/debian.conf
# debian/setup/openssh-server.sh
PermitRootLogin no
PasswordAuthentication no
EOF
service sshd restart
