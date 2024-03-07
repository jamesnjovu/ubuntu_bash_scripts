#! /bin/bash

sudo apt update

sudo apt install git bc

cd ~

rm -r rtl8852be_bt

git clone https://github.com/HRex39/rtl8852be_bt.git

cd /root/rtl8852be_bt

make

sudo make install

cd ../

sudo apt remove blueman bluez bluez-obexd

sudo apt purge blueman bluez bluez-obexd

sudo apt autoremove -y

sudo apt install blueman -y

sudo apt install bluez bluez-obexd -y

reboot
