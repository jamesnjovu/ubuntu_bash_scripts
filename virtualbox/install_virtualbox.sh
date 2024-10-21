#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Import VirtualBox’s Repo GPG Key
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg

# Add VirtualBox Repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian $(. /etc/os-release && echo "$VERSION_CODENAME") contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Run System Update
sudo apt update

# Install VirtualBox 7 on Ubuntu 24.04 LTS
sudo apt install virtualbox-7.0 -y

# Install VirtualBox Extension Pack
vboxmanage -v | cut -dr -f1

wget https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack

sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack

vboxmanage list extpacks

# Add User to vboxusers Group
sudo usermod -aG vboxusers $USER

groups $USER
