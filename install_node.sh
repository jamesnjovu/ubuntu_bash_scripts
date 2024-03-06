#! /bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh

sudo bash /tmp/nodesource_setup.sh

sudo apt install nodejs -y

node -v
