#!/bin/bash

# Function to display help
display_help() {
    echo "Usage: $0 {install_plugin|install_version|set_global_version|current_versions}"
    echo
    echo "Commands:"
    echo "  install_plugin     Install a plugin (e.g., Node.js, Elixir)"
    echo "  install_version    Install a specific version of a tool"
    echo "  set_global_version Set the global version for a tool"
    echo "  current_versions   Display current versions of installed tools"
    exit 1
}

# Check if asdf is installed
if ! command -v asdf &> /dev/null
then
    echo "asdf is not installed. Please install it first."
    exit 1
fi

# Handle the commands
case "$1" in
    install_plugin)
        if [ -z "$2" ]; then
            echo "Please specify a plugin to install."
            exit 1
        fi
        echo "Installing plugin: $2"
        asdf plugin-add "$2"
        ;;
    install_version)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Please specify a plugin and version to install."
            echo "Usage: $0 install_version <plugin> <version>"
            exit 1
        fi
        echo "Installing $2 version $3"
        asdf install "$2" "$3"
        ;;
    set_global_version)
        if [ -z "$2" ] || [ -z "$3" ]; then
            echo "Please specify a plugin and version to set globally."
            echo "Usage: $0 set_global_version <plugin> <version>"
            exit 1
        fi
        echo "Setting global $2 version to $3"
        asdf global "$2" "$3"
        ;;
    current_versions)
        echo "Current versions of installed tools:"
        asdf current
        ;;
    *)
        display_help
        ;;
esac
