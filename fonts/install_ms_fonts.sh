#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer
sudo fc-cache -f -v
