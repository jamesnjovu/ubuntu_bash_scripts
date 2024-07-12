#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo add-apt-repository universe

sudo apt update -y

sudo apt autoremove

sudo apt-get -y install inotify-tools

sudo apt-get -y install build-essential

sudo apt -y upgrade
