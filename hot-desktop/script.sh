#!/bin/bash

exit 1

apt-get install -y dbus-user-session
# reboot

### ssh server
apt-get install -y openssh-server
cat << EOF > /etc/ssh/sshd_config.d/hot.conf
PermitRootLogin no
PasswordAuthentication no
EOF
service sshd restart

### admin user
useradd admin -m -s /bin/bash
# allow admin user to sudo without password, since admin user does not have a password
cat << EOF > /etc/sudoers
admin ALL=(ALL) NOPASSWD: ALL
EOF
# import public key for admin user
systemd-run --uid=admin --pipe /bin/bash << EOF
mkdir -p ~/.ssh
cp /hot-desktop/authorized_keys > ~/.ssh/authorized_keys
EOF


apt-get install -y \
  acpid