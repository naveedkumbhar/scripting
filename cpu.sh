#Author: Naveed Ahmed
#Script Name: cpu.sh
#Description: Install a cronjob to run this script after every minute, and then it will check for CPU 
# utlization if CPU UTILIZATION > 50 it will send an email with highCPU utlization message
#Prerequistic # You must have installed postfix or exim as outgoing mail server



#!/bin/bash
crontab << EOF
*/1 * * * * /bin/bash /root/cpu.sh >/dev/null
EOF
publicip=`wget -q -O - 169.254.169.254/latest/meta-data/public-ipv4` # For AWS EC2 Instance
total=`ps -A -o pcpu | tail -n+2 | paste -sd+ | bc`
if (( $(bc <<< "$total > 50") )); then
echo -e "CPU utilization : $total  \nHostname : $(hostname) \n Public IP : $publicip \n Automatic mail Generated! "
echo -e "CPU utilization : $total  \nHostname : $(hostname) \n Public IP : $publicip \n Automatic mail Generated! " | mail -s "Warning! HIGH CPU UTILIZATION on $(hostname)" naveed_kumbhar@hotmail.com
else
echo "CPU utilization $total  is Normal"
fi


