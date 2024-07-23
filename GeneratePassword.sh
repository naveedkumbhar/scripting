#!/bin/bash

# Function to display help
display_help() {
    echo "Usage: $0 [length]"
    echo
    echo "Generate a random password."
    echo
    echo "  length    specify the length of the password to generate (default is 12)"
    echo
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

# Check if the argument is a valid number
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Length must be a number."
    display_help
    exit 1
fi

# Length of the password from the argument
LENGTH=$1

# Generate a random password
PASSWORD=$(openssl rand -base64 $LENGTH)

# Print the password
echo "Generated Password: $PASSWORD"

