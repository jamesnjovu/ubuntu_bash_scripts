#! /bin/bash

sudo apt update

sudo apt install git bc

cd ~

rm -rf rtl8852be

git clone https://github.com/HRex39/rtl8852be.git

cd /root/rtl8852be

make

sudo make install

sudo modprobe 8852be
