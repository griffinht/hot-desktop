#!/bin/bash

./create_payload.sh 192.168.0.254:8080 192.168.0.6

cat << 'EOF' >> html/preseed
d-i preseed/early_command string /bin/sh -c "modprobe atl1c && echo "1969 1083" > /sys/bus/pci/drivers/atl1c/new_id";
EOF

# https://wiki.debian.org/InstallingDebianOn/HP/Envy%2014%20Beats%20Edition%202020ep
cat << 'EOF' >> html/payload/setup/install-fix-ethernet.sh

cat << 'EOFF' >> /usr/local/lib/fix-ethernet.sh
#!/bin/sh

# debian/envy-laptop/envy-laptop.sh

modprobe atl1c
echo "1969 1083" > /sys/bus/pci/drivers/atl1c/new_id
EOFF

cat << 'EOFF' >> /etc/systemd/system/fix-ethernet.service
# debian/envy-laptop/envy-laptop.sh
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/lib/fix-ethernet.sh

[Install]
WantedBy=multi-user.target
EOFF

EOF
cat << EOF >> html/setup.sh
./setup/install-fix-ethernet.sh
EOF