#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Get the home directory of the non-root user who ran the script with sudo
USER_HOME=$(eval echo ~"$SUDO_USER")

# Update and install required packages
echo "Updating package list and installing curl and git..."
sudo apt-get update -y && sudo apt-get install curl git -y

# Check if asdf is already installed
if [ -d "$USER_HOME/.asdf" ]; then
    echo "asdf is already installed in $USER_HOME/.asdf"
else
    # Clone the asdf repository
    echo "Cloning asdf repository..."
    git clone https://github.com/asdf-vm/asdf.git $USER_HOME/.asdf --branch v0.14.0

    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone asdf repository. Please check your connection and try again."
        exit 1
    fi
fi

# Check if .bashrc already contains asdf initialization
if ! grep -q ". \$USER_HOME/.asdf/asdf.sh" "$USER_HOME/.bashrc"; then
    echo "Adding asdf initialization to .bashrc..."
    echo '. $USER_HOME/.asdf/asdf.sh' >> ~/.bashrc
else
    echo "asdf initialization already present in .bashrc"
fi

if ! grep -q ". \$USER_HOME/.asdf/completions/asdf.bash" "$USER_HOME/.bashrc"; then
    echo "Adding asdf completions to .bashrc..."
    echo '. $USER_HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
else
    echo "asdf completions already present in .bashrc"
fi

# Reload .bashrc
echo "Sourcing .bashrc to apply changes..."
source ~/.bashrc

# Check if asdf command is available
if command_exists asdf; then
    echo "asdf installation and setup completed successfully!"
else
    echo "Error: asdf command not found. Please check your setup."
    exit 1
fi
