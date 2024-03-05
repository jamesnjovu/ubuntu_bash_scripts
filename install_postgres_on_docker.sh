#! /bin/bash

sudo docker pull postgres

sudo docker run --name postgres-0 -e POSTGRES_PASSWORD=Qwerty12 -p 5433:5433 -d postgres


