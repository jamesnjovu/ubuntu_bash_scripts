#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi


sudo docker pull redis/redis-stack-server:latest

sudo docker run -d --name redis -p 6379:6379 redis/redis-stack-server:latest
