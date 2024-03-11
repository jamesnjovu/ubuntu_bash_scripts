#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# wget -O - https://repo.fortinet.com/repo/7.0/ubuntu/DEB-GPG-KEY | sudo apt-key add -

# sh -c 'echo "deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list.d/forticlient.list'

# apt update

# apt install forticlient

cd ~

wget http://cdn.software-mirrors.com/forticlientsslvpn_linux_4.4.2328.tar.gz

tar -xzvf forticlientsslvpn_linux_4.4.2328.tar.gz

sudo apt-get install ppp

cd ./forticlientsslvpn/64bit/helper

sudo ./setup.linux.sh

apt install expect -y
