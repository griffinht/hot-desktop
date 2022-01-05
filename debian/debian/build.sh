#!/bin/bash

HOST="$1"
if [ -z "$HOST" ]; then
  echo "HOST not specified"
  exit 1
fi;

ADDRESS="$2"
if [ -z "$ADDRESS" ]; then
  echo "ADDRESS not specified"
  exit 1
fi;

rm -rf html
mkdir html

cp preseed html/preseed
tar -cf html/payload.tar payload

cd html || exit

cat << EOF >> preseed
d-i preseed/late_command string apt-install curl; in-target curl $HOST/http.sh -O http.sh; in-target bash http.sh;
EOF

cat << EOF > http.sh
curl $HOST/payload.tar -O payload.tar
tar -xf payload.tar -C /
rm payload.tar
(
cd ./payload
./payload/setup.sh $ADDRESS
)
# cleanup
rm -r /payload
rm http.sh
EOF
