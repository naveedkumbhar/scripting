#!/bin/bash

# Length of the password
LENGTH=12

# Generate a random password
PASSWORD=$(openssl rand -base64 $LENGTH)

# Print the password
echo "Generated Password: $PASSWORD"

