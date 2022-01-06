#!/bin/bash

DEVICE="$0"
if [ -z "$DEVICE" ]; then
    echo "specify a device"
    exit 1
fi;

curl https://raspi.debian.net/daily/raspi_1_bullseye.img.xz | xzcat | sudo dd of="$DEVICE" bs=64k oflag=dsync status=progress
