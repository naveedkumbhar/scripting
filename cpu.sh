#Author: Naveed Ahmed
#Script Name: cpu.sh
#Description: Install a cronjob to run this script after every minute, and then it will check for CPU 
# utlization if CPU UTILIZATION > 50 it will send an email with highCPU utlization message
#Prerequistic # You must have installed postfix or exim as outgoing mail server



#!/bin/bash
crontab << EOF
*/1 * * * * /bin/bash /root/cpu.sh >/dev/null
EOF
total=`ps -A -o pcpu | tail -n+2 | paste -sd+ | bc`
if (( $(bc <<< "$total > 50") )); then
echo "CPU UTILIZATION IS $total high" | mail -s "HIGH CPU UTILIZATION" naveed_kumbhar@hotmail.com
else
echo "Normal"
fi

