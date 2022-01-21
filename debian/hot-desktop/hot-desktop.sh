#!/bin/bash
set -e

HOST="$1"
KEYS="$2"

./create_payload.sh "$HOST" 192.168.0.5 enp4s0 "$KEYS"