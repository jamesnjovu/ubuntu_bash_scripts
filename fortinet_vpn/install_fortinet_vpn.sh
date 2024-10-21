#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Function to check if FortiClient is installed
check_forticlient_installed() {
  if command -v forticlient &> /dev/null; then
    return 0  # FortiClient is installed
    echo "forticlient already installed"
  exit 1
  else
    return 1  # FortiClient is not installed
  fi
}

# Uncomment these lines if using the Fortinet repository
# wget -O - https://repo.fortinet.com/repo/7.0/ubuntu/DEB-GPG-KEY | apt-key add -
# echo "deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list.d/forticlient.list

# Update package lists
apt update

# Check if FortiClient is already installed
if check_forticlient_installed; then
  echo "FortiClient is already installed."
  exit 0
fi

# Install dependencies
apt install ppp expect -y

# Download FortiClient SSL VPN
cd ~
wget http://cdn.software-mirrors.com/forticlientsslvpn_linux_4.4.2328.tar.gz

# Extract the package
tar -xzvf forticlientsslvpn_linux_4.4.2328.tar.gz

# Navigate to the installer directory
cd ./forticlientsslvpn/64bit/helper

# Run the setup script
if sudo ./setup.linux.sh; then
  echo "FortiClient installed successfully."
else
  echo "FortiClient installation failed."
  exit 1
fi

# Clean up
cd "$HOME"
rm -f forticlientsslvpn_linux_4.4.2328.tar.gz

echo "Installation complete."
