#!/bin/bash

# Update the package index
sudo apt update

# Install curl if it's not already installed
sudo apt install -y curl

# Fetch the setup script for the latest version of Node.js (LTS)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Install Node.js
sudo apt install -y nodejs

# Optionally, install build tools
sudo apt install -y build-essential

# Verify the installation
node -v
npm -v
