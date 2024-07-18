#!/bin/bash

# Author: Naveed Ahmed
# Script Name: cpu.sh
# Description: This script installs a cron job to run itself every minute. It checks for CPU utilization 
#              and if CPU utilization is greater than 50%, it sends an email with a high CPU utilization message.
# Prerequisites: You must have Postfix or Exim installed as an outgoing mail server.
#                Edit the cron job according to your requirements.

# Install a cron job to run this script every minute
# The cron job will redirect its output to /dev/null to prevent cron from sending emails every minute
(crontab -l 2>/dev/null; echo "*/1 * * * * /bin/bash /root/cpu.sh >/dev/null") | crontab -

# Fetch the public IP address of the server
publicip=$(curl -s http://whatismijnip.nl | cut -d " " -f 5)

# Calculate the total CPU utilization
# -A: Select all processes
# -o pcpu: Output only the CPU utilization column
# tail -n+2: Skip the header line
# paste -sd+: Concatenate the CPU percentages with '+' signs
# bc: Calculate the sum
total=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc)

# Check if the total CPU utilization is greater than 50%
if (( $(bc <<< "$total > 50") )); then
    # If CPU utilization is high, prepare the email content
    echo -e "\n\n\nCPU utilization: $total HIGH\nHostname: $(hostname)\nPublic IP: $publicip\n\n"
    echo -e "\nWarning!\nCPU utilization: $total HIGH\nHostname: $(hostname)\nPublic IP: $publicip\n\n\nAutomatic mail generated!" | mail -s "Warning! HIGH CPU UTILIZATION on $(hostname): $publicip" naveed_kumbhar@hotmail.com
else
    # If CPU utilization is normal, print a message
    echo -e "\n\n\nCPU utilization: $total is Normal\nHostname: $(hostname)\nPublic IP: $publicip\n\n"
fi

