#! /bin/bash

sudo kill -9 $(sudo lsof -t -i:80)
sudo kill -9 $(sudo lsof -t -i:443)

sudo certbot renew
