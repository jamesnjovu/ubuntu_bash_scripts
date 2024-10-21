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

# Add the Elixir plugin if not already added
if ! asdf plugin-list | grep -q "elixir"; then
    echo "Adding Elixir plugin..."
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
else
    echo "Elixir plugin is already added."
fi

# Prompt the user for a version
read -p "Enter the Elixir version to install (default is 1.14.5-otp-26): " elixir_version

# Use default version if no input is provided
elixir_version=${elixir_version:-1.14.5-otp-26}

# Check if the version is already installed
if asdf list elixir | grep -q "$elixir_version"; then
    echo "Elixir version $elixir_version is already installed."
else
    echo "Installing Elixir version $elixir_version..."
    asdf install elixir "$elixir_version"
fi

# Set the global version
echo "Setting global Elixir version to $elixir_version..."
asdf global elixir "$elixir_version"

# Confirm the installation
echo "Elixir version installed and set globally:"
asdf current elixir
