#! /bin/bash

sudo apt-get install curl git

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

source ~/.bashrc
