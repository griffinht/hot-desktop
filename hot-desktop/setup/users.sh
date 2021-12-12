#!/bin/bash

useradd admin -m -s /bin/bash
# allow admin user to sudo without password, since admin user does not have a password
cat << EOF > /etc/sudoers
# hot-desktop/setup/users.sh
admin ALL=(ALL) NOPASSWD: ALL
EOF
# import public key for admin user
su - admin << EOF
mkdir -p ~/.ssh
cat /hot-desktop/authorized_keys > ~/.ssh/authorized_keys
EOF