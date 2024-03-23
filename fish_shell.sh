#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo apt-add-repository ppa:fish-shell/release-3

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install fish

sudo chsh -s /usr/local/bin/fish
