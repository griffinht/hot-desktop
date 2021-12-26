#!/bin/bash

HOST="$1"
if [ -z "$HOST" ]; then
  echo "HOST not specified"
  exit 1
fi;

mkdir html

cp preseed html/preseed
tar -cf html/hot-desktop.tar hot-desktop

cd html || exit

cat << EOF >> preseed
d-i preseed/late_command string apt-install curl; in-target curl $HOST/http.sh -O http.sh; in-target bash http.sh;
EOF

cat << EOF > http.sh
curl $HOST/hot-desktop.tar -O hot-desktop.tar
tar -xf hot-desktop.tar -C /
rm hot-desktop.tar
./hot-desktop/setup.sh
rm http.sh
EOF
