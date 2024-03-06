#! /bin/bash

sudo docker pull postgres

sudo docker run --name postgres -e POSTGRES_PASSWORD=Qwerty12 -p 5432:5432 -d postgres
