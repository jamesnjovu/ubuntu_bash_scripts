#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

cd ~

curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh

bash /tmp/nodesource_setup.sh

apt install nodejs -y

node -v
