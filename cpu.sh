#Author: Naveed Ahmed
#Script Name: cpu.sh
#Description: Install a cronjob to run this script after every minute, and then it will check for CPU 
# utlization if CPU UTILIZATION > 50 it will send an email with highCPU utlization message
#Prerequistic # You must have installed postfix or exim as outgoing mail server
# Edit cronjob according to your requirement
# If you're using 



#!/bin/bash
crontab << EOF
*/1 * * * * /bin/bash /root/cpu.sh >/dev/null
EOF
publicip=`curl -s http://whatismijnip.nl |cut -d " " -f 5`
total=`ps -A -o pcpu | tail -n+2 | paste -sd+ | bc`
if (( $(bc <<< "$total > 50") )); then
echo -e "\n\n\nCPU utilization : $total HIGH \nHostname : $(hostname) \nPublic IP : $publicip\n\n"
echo -e "\nWarnnig!\nCPU utilization : $total High  \nHostname : $(hostname) \nPublic IP : $publicip \n\n\nAutomatic mail Generated! " | mail -s "Warning! HIGH CPU UTILIZATION on $(hostname) : $publicip" naveed_kumbhar@hotmail.com
else
echo -e "\n\n\nCPU utilization : $total is Normal  \nHostname : $(hostname) \nPublic IP : $publicip\n\n"
fi



