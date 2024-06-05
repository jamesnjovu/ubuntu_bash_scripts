#! /bin/bash

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

asdf install erlang 26.2.5
asdf global erlang 26.2.5
