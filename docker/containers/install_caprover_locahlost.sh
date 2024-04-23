#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

ufw allow 80,443,3000,996,7946,4789,2377/tcp

# fw allow 7946,4789,2377/udp

ufw enable

sudo docker run -p 80:80 -p 443:443 -p 3000:3000 -e ACCEPTED_TERMS=true -e MAIN_NODE_IP_ADDRESS=127.0.0.1 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover

# default_password=captain42