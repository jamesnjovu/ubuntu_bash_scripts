#! /bin/bash

sudo apt-add-repository ppa:fish-shell/release-3

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install fish

sudo chsh -s /usr/local/bin/fish
