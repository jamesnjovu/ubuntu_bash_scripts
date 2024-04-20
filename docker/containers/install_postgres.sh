#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

sudo docker pull postgres

sudo docker run --name postgres -e POSTGRES_PASSWORD=Qwerty12 -p 5432:5432 -d postgres
