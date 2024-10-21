# ASDF Manager Scripts

This repository contains useful bash scripts to help manage the installation of the ASDF version manager and its plugins for Elixir and Erlang. These scripts streamline the process of setting up `asdf` and configuring the Elixir and Erlang runtimes.

## Scripts

1. [**asdf_manager.sh**](#asdf_managersh) - Script for installing `asdf`.
2. [**plugin_erlang.sh**](#install_erlangsh) - Script for installing Erlang with `asdf`.
3. [**plugin_elixir.sh**](#plugin_elixirsh) - Script for installing Elixir with `asdf`.

---

## Prerequisites

Ensure you have the following installed:
- **Git**: Required for cloning repositories.
- **`asdf` version manager**: If it’s not installed, the `asdf_manager.sh` script will handle the installation.
- **Sudo access**: Some scripts install system-wide dependencies, so root access is required.

---
## <a name="asdf_managersh"></a>asdf_manager.sh

### Purpose:
This script installs the `asdf` version manager in the current user's environment and sets up `asdf` in your shell by modifying `.bashrc` or `.zshrc`.

### Usage:
1. Clone the repository:
   ```bash
   git clone https://github.com/jamesnjovu/ubuntu_bash_scripts.git
   ```
2. Make the script executable:
   ```bash
   chmod +x asdf/asdf_manager.sh
   ```
3. Run the script:
   ```bash
   ./asdf/asdf_manager.sh
   ```

### Actions:
- Installs `asdf` Required for cloning repositories.
- Modifies the user’s shell configuration to source `asdf` automatically.
- Reloads the shell to apply changes.

---
## <a name="plugin_erlangsh"></a>install_erlang.sh

### Purpose:
This script installs a specific version of Erlang using `asdf`. It checks for the required dependencies and installs them before setting up Erlang.

### Usage:
1. Make the script executable:
   ```bash
   chmod +x asdf/plugin_erlang.sh
   ```
2. Run the script:
   ```bash
   ./asdf/plugin_erlang.sh
   ```

### Actions:
- Sources `asdf` from the correct home directory of the original user if run with `sudo`.
- Adds the Erlang plugin to `asdf` (if not already added).
- Prompts the user to enter a version of Erlang to install (default is 26.2.5).
- Installs the required system dependencies for building Erlang.
- Sets the specified or default version as the global Erlang version.
---
## <a name="plugin_elixirsh"></a>plugin_elixir.sh

### Purpose:
This script installs a specific version of Elixir using `asdf`. It checks for the necessary Elixir plugin and installs the desired version.

### Usage:
1. Make the script executable:
   ```bash
   chmod +x asdf/plugin_elixir.sh
   ```
2. Run the script:
   ```bash
   ./asdf/plugin_elixir.sh
   ```

### Actions:
- Sources `asdf` from the correct home directory of the original user if run with `sudo`.
- Adds the Elixir plugin to `asdf` (if not already added).
- Prompts the user to enter a version of Elixir to install (default is `1.14.5-otp-26`).
- Installs the specified or default version of Elixir.
- Sets the installed version as the global version.

---
## Troubleshooting

### Common Issues:
- `asdf: not found`: Ensure that the `asdf` version manager is installed and sourced correctly. Run `source ~/.bashrc` or `source ~/.zshrc` to reload the shell.
- `Permission issues`: Some operations (like installing system dependencies) may require `sudo` access. Run the scripts with `sudo` where necessary.

### Check Installed Versions:
- Verify that `asdf` is installed and functioning:
    ```bash
    asdf --version
    ```
- List installed versions of Elixir or Erlang:
    ```bash
    asdf list elixir
    asdf list erlang
    ```

---
## License
This project is licensed under the MIT License.

---
Feel free to update the instructions based on your own environment and use cases.

Let me know if you need any other modifications!