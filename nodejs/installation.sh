#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

NODE_V="20.x"

cd ~

echo "Getting node version $NODE_V"

curl -sL https://deb.nodesource.com/setup_$NODE_V -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh

echo "Installing node version $NODE_V"

apt-get install nodejs -y

sudo apt-get install nodejs -y

echo "Installing Done"

echo node -v
echo npm -v
