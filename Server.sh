#!/bin/bash

# Define colors
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check if PHP is installed
check_php() {
    if ! command -v php &> /dev/null; then
        echo "PHP is not installed. Installing PHP..."
        apt update
        apt install php -y
    else
        echo "PHP is already installed."
    fi
}

# Function to start PHP server
start_php_server() {
    PORT=3500
    php -S localhost:$PORT &
    PHP_SERVER_PID=$!
    
    echo -e "${BLUE}PHP server was successfully started, to open your website, please open a web browser and go to http://localhost:$PORT${NC}"
}

# Function to display author message
display_author_message() {
    echo -e "${RED}Script made by Ahmed ABS${NC}"
}

# Check if PHP is installed
check_php

# Start PHP server
start_php_server

# Display author message
display_author_message
