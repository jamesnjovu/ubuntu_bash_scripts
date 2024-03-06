#! /bin/bash

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

asdf install erlang 25.2.3
asdf global erlang 25.2.3