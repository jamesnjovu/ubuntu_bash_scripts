#!/bin/bash

# Get the home directory of the non-root user who ran the script with sudo
USER_HOME=$(eval echo ~"$SUDO_USER")

# Ensure asdf is sourced from the correct home directory
if [ -f "$USER_HOME/.asdf/asdf.sh" ]; then
    echo "Sourcing asdf from $USER_HOME..."
    source "$USER_HOME/.asdf/asdf.sh"
else
    echo "Error: asdf is not installed or not properly configured for $SUDO_USER."
    exit 1
fi

# Add the Erlang plugin if not already added
if ! asdf plugin-list | grep -q "erlang"; then
    echo "Adding Erlang plugin..."
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
else
    echo "Erlang plugin is already added."
fi

# Install required packages for building Erlang
echo "Installing required build packages..."
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

# Set KERL configure options to disable debugging and exclude javac
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

# Prompt the user for an Erlang version or use the default
read -p "Enter the Erlang version to install (default is 26.2.5): " erlang_version
erlang_version=${erlang_version:-26.2.5}

# Check if the version is already installed
if asdf list erlang | grep -q "$erlang_version"; then
    echo "Erlang version $erlang_version is already installed."
else
    echo "Installing Erlang version $erlang_version..."
    asdf install erlang "$erlang_version"
fi

# Set the global version
echo "Setting global Erlang version to $erlang_version..."
asdf global erlang "$erlang_version"

# Confirm the installation
echo "Erlang version installed and set globally:"
asdf current erlang
