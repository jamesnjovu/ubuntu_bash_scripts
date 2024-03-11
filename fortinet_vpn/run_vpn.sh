#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Forticlient SSL VPN Client launching script utilizing expect.

# --------------------------------------------
# CONFIGURATION

# If empty - script will take some simple logic to locate appropriate binary.
FORTICLIENT_PATH="/root/forticlientsslvpn/64bit"

# VPN Credentials
VPN_HOST="local:10443"
VPN_USER=""
VPN_PASS=""

cd $FORTICLIENT_PATH

./forticlientsslvpn_cli --server $VPN_HOST --vpnuser $VPN_USER --keepalive
