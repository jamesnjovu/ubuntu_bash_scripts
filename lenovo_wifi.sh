#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo apt update

sudo apt install git bc

cd ~

pwd

ls

sudo rm -rf rtl8852be

git clone https://github.com/HRex39/rtl8852be.git

pwd

ls

cd rtl8852be

make

sudo make install

sudo modprobe 8852be
