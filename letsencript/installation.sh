#! /bin/bash

sudo ufw allow 80
sudo ufw allow 443

echo ufw status

sudo apt update

sudo apt install certbot letsencrypt

sudo systemctl status certbot.timer
