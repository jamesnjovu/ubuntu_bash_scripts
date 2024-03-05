#! /bin/bash

docker pull dpage/pgadmin4

sudo docker run --name pgadmin -p 5433:5433 -e 'PGADMIN_DEFAULT_EMAIL=njovujames@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=Qwerty12' -d dpage/pgadmin4

