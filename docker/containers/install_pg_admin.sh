#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

docker pull dpage/pgadmin4

sudo docker run --name pgadmin -p 5050:80 -e 'PGADMIN_DEFAULT_EMAIL=njovujames@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=Qwerty12' -d dpage/pgadmin4
