#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Forticlient SSL VPN Client launching script utilizing expect.

# --------------------------------------------
# CONFIGURATION

# If empty - script will take some simple logic to locate appropriate binary.
FORTICLIENT_PATH="$HOME/forticlientsslvpn/64bit"

# VPN Credentials
VPN_HOST="localhost:10443"  # Updated to your VPN host
VPN_USER="j.njovu"
VPN_PASS=""

# Prompt for VPN password
if [[ -z "$VPN_PASS" ]]; then
  read -sp "Enter VPN password: " VPN_PASS
  echo
fi

# Check if the FortiClient binary exists
if [[ ! -f "$FORTICLIENT_PATH/forticlientsslvpn_cli" ]]; then
  echo "FortiClient binary not found in $FORTICLIENT_PATH. Please check the installation."
  exit 1
fi

cd "$FORTICLIENT_PATH"

# Use expect to handle the VPN password input
expect -c "
set timeout 10
spawn ./forticlientsslvpn_cli --server $VPN_HOST --vpnuser $VPN_USER --keepalive
expect {
  \"Password for VPN:\" {
    send \"$VPN_PASS\r\"
  }
  timeout {
    puts \"Connection timed out. Please check the VPN server and your network connection.\"
    exit 1
  }
}
interact
"

# Check if the VPN connection was successful
if [ $? -eq 0 ]; then
  echo "VPN connected successfully."
else
  echo "Failed to connect to VPN."
  exit 1
fi
