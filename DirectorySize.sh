#!/bin/bash
# ScriptName: DirectorySize.sh 
# Author: Naveed Ahmed
# Company: DigitalOcean 
# Description: This script calculates and displays the total size of a specified directory.

# Prompt the user to enter the directory they want to check
echo "Please enter the directory path you want to check the size of:"
read dir

# Check if the directory exists
if [ -d "$dir" ]; then
    # Calculate the total size of the directory
    size=$(du -ch "$dir" | grep total | awk '{print $1}')

    # Display the total size to the user
    echo "The total size of the directory '$dir' is $size."
else
    # Display an error message if the directory does not exist
    echo "The directory '$dir' does not exist. Please enter a valid directory path."
fi

