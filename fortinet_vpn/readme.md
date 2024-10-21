# FortiClient VPN Connection Script

This repository contains a Bash script that automates the connection to a FortiClient SSL VPN using the `forticlientsslvpn_cli` command-line interface. The script uses `expect` to securely input the VPN password and maintain the connection.

## Requirements

- **Operating System:** Ubuntu or any Debian-based system
- **FortiClient SSL VPN:** Ensure that the FortiClient SSL VPN client is installed.
- **Expect:** The `expect` utility must be installed. You can install it using the following command:

  ```bash
  sudo apt install expect
  ```

## Installation
1. Clone this repository (or download the scripts) to your desired directory:
   ```bash
   git clone https://github.com/jamesnjovu/ubuntu_bash_scripts.git
   cd ubuntu_bash_scripts
   ```
2. Make the script executable:
   ```bash
   chmod +x run_vpn.sh
   ```
3. Edit the script configuration:
  - Open `run_vpn.sh` and update the `VPN_HOST` and `VPN_USER` variables as needed.
  - You may also modify the `FORTICLIENT_PATH` if your FortiClient installation path is different.

## Requirements
1. Run the VPN connection script with root privileges:
   ```bash
   sudo ./run_vpn.sh
   ```
2. Enter your VPN password when prompted.


## Troubleshooting
- If you encounter issues connecting to the VPN, check the following:
  - Ensure the FortiClient binary exists in the specified path.
  - Verify your VPN credentials (host, username, password).
  - Make sure you have a stable network connection.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- Thanks to the developers of FortiClient for providing the SSL VPN client.
- Special thanks to the `expect` community for the automation capabilities.
