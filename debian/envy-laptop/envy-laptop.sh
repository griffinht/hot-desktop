#!/bin/bash

./build.sh 192.168.0.254:8080 192.168.0.6

cat << EOF > html/preseed
d-i preseed/early_command string \
    /bin/sh -c "modprobe atl1c && echo "1969 1083" > /sys/bus/pci/drivers/atl1c/new_id"; \
    in-target /bin/sh -c "modprobe atl1c && echo "1969 1083" > /sys/bus/pci/drivers/atl1c/new_id";
EOF