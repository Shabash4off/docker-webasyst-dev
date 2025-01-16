#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Source utility functions
source "$SCRIPT_DIR/utils.sh"

# Function to configure the environment
configure_environment() {
    if prompt_yes_no "Do you want to configure the environment?"; then
        if prompt_yes_no "Use default values for all settings?"; then
            "$SCRIPT_DIR/configure.sh" --default
        else
            "$SCRIPT_DIR/configure.sh"
        fi
    else
        echo "Skipping environment configuration. Using existing .env file if present."
    fi
}

# Function to clone repositories
clone_repositories() {
    if [ ! -d "$PROJECT_ROOT/engine" ]; then
        echo "Cloning webasyst-framework repository..."
        git clone https://github.com/webasyst/webasyst-framework.git "$PROJECT_ROOT/engine"
    else
        echo "webasyst-framework repository already exists. Skipping clone."
    fi

    if prompt_yes_no "Do you want to clone the shop-script repository?"; then
        if [ ! -d "$PROJECT_ROOT/engine/wa-apps/shop" ]; then
            echo "Cloning shop-script repository..."
            git clone https://github.com/webasyst/shop-script.git "$PROJECT_ROOT/engine/wa-apps/shop"
        else
            echo "shop-script repository already exists. Skipping clone."
        fi
    else
        echo "Skipping shop-script repository clone."
    fi
}

# Function to set proper permissions
set_permissions() {
    echo "Setting TOO OPEN permissions..."
    echo "WARN: PERMISIONS FOR $PROJECT_ROOT/engine IS NOW 777 BE AWARE!!!"
    sudo chmod -R 777 "$PROJECT_ROOT/engine"
}

# Main setup function
main() {
    echo "Starting Webasyst setup..."

    configure_environment
    clone_repositories
    set_permissions

    echo "Setup complete!"
}

# Run the main function
main
