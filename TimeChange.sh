#Script name: time.sh
#Author: Naveed
#Purpose: set date and time easily

#!/bin/bash
arg=$1
if [ $# != 1 ] 
then
echo -e "\n\n\nProvide valid time and date formate for example : 122409532014.00"
echo -e "\n12 is month, 24 is date, 09 is hour, 53 is mint, 2014 is year and .00 is second" 
else
date $1
fi
