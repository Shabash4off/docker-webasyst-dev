#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Source utility functions
source "$SCRIPT_DIR/utils.sh"
# Set the path to the .env file
ENV_FILE="${PROJECT_ROOT}/.env"

# Configuration variables
declare -A config

# Initialize configuration with default values
initialize_config() {
    config[MYSQL_ROOT_PASSWORD]="root"
    config[MYSQL_DATABASE]="wa"
    config[MYSQL_USER]="webasyst"
    config[MYSQL_PASSWORD]="webasyst"
    config[PHP_VERSION]="7.4"
    config[MYSQL_VERSION]="5.7"
}

# Prompt user for configuration values
prompt_for_config() {
    config[MYSQL_ROOT_PASSWORD]=$(prompt_with_default "Enter MySQL root password" "${config[MYSQL_ROOT_PASSWORD]}")
    config[MYSQL_DATABASE]=$(prompt_with_default "Enter MySQL database name" "${config[MYSQL_DATABASE]}")
    config[MYSQL_USER]=$(prompt_with_default "Enter MySQL user" "${config[MYSQL_USER]}")
    config[MYSQL_PASSWORD]=$(prompt_with_default "Enter MySQL password" "${config[MYSQL_PASSWORD]}")
    config[PHP_VERSION]=$(prompt_with_default "Enter PHP version" "${config[PHP_VERSION]}")
    config[MYSQL_VERSION]=$(prompt_with_default "Enter MySQL version" "${config[MYSQL_VERSION]}")
}

# Write configuration to .env file
write_config() {
    # Clear the existing .env file or create a new one
    > "$ENV_FILE"

    echo "# Password for root user" >> "$ENV_FILE"
    echo "MYSQL_ROOT_PASSWORD=${config[MYSQL_ROOT_PASSWORD]}" >> "$ENV_FILE"
    echo "" >> "$ENV_FILE"
    echo "# Name for the webasyst database" >> "$ENV_FILE"
    echo "MYSQL_DATABASE=${config[MYSQL_DATABASE]}" >> "$ENV_FILE"
    echo "" >> "$ENV_FILE"
    echo "# Username and password for user that will have full access to the webasyst database" >> "$ENV_FILE"
    echo "MYSQL_USER=${config[MYSQL_USER]}" >> "$ENV_FILE"
    echo "MYSQL_PASSWORD=${config[MYSQL_PASSWORD]}" >> "$ENV_FILE"
    echo "" >> "$ENV_FILE"
    echo "# PHP and MySQL versions" >> "$ENV_FILE"
    echo "PHP_VERSION=${config[PHP_VERSION]}" >> "$ENV_FILE"
    echo "MYSQL_VERSION=${config[MYSQL_VERSION]}" >> "$ENV_FILE"
}

# Main function
main() {
    initialize_config

    if [ "$1" != "--default" ]; then
        prompt_for_config
    fi

    write_config

    echo "Configuration complete. .env file updated at $ENV_FILE"
}

# Run the main function
main "$@"