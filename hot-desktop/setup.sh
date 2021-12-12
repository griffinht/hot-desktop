#!/bin/bash

/hot-desktop/setup/system.sh
/hot-desktop/setup/users.sh
/hot-desktop/setup/openssh-server.sh
/hot-desktop/setup/static-ip.sh

# cleanup
rm -r /hot-desktop