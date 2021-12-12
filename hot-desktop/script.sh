#!/bin/bash

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
su - admin << EOF
mkdir -p ~/.ssh
cat /hot-desktop/authorized_keys > ~/.ssh/authorized_keys
EOF

### system setup
# acpid makes shutdown work
apt-get install -y acpid
# needed for systemd-run
#apt-get install -y dbus-user-session
# reboot??



### cleanup
rm -r /hot-desktop