#!/bin/bash

# Script Name: LengthCount.sh
# Purpose:     Counts the number of characters in a given input
# Author:      Naveed Ahmed
# Company:     DigitalOcean
# Description: This script prompts the user to enter a value and then calculates and displays the length of the input.

# Prompt the user to enter a value
echo "Please enter the value you want to count the characters of:"
read input_value

# Calculate the length of the input
length=${#input_value}

# Display the length of the input
echo "The length of '$input_value' is $length characters."

# End of script

