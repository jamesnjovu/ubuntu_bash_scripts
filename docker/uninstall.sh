#! /bin/bash

sudo apt --fix-broken install

sudo apt-get autoremove -y --purge docker.io
