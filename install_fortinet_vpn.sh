#! /bin/bash

# wget -O - https://repo.fortinet.com/repo/7.0/ubuntu/DEB-GPG-KEY | sudo apt-key add -

# sudo sh -c 'echo "deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list.d/forticlient.list'

# sudo apt update

# sudo apt install forticlient

cd ~

pwd

wget http://cdn.software-mirrors.com/forticlientsslvpn_linux_4.4.2328.tar.gz

tar -xzvf forticlientsslvpn_linux_4.4.2328.tar.gz

sudo apt-get install ppp

cd ./forticlientsslvpn/64bit/helper

sudo ./setup.linux.sh
