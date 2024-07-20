#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo apt install openjdk-16-jre # installing Java Enviroment
sudo snap install --devmode --beta anbox # installing anbox
sudo apt install dkms # installing ubuntu 20.04 dkms modules because currently ppa is disabled by default from Ubuntu security
sudo apt install linux-headers-generic # installing the headers
sudo snap install render # installs a render lib which helps anbox of rendering the windows and that's why some of you got issues when running from command line or it was super slow
