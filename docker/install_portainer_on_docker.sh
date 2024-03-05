#! /bin/bash

sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce:latest
