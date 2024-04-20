#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo docker volume create portainer_data

sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
