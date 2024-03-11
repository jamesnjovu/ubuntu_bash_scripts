#! /bin/bash

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir 1.14.5-otp-25

asdf global elixir 1.14.5-otp-25

sudo apt-get -y install inotify-tools
