#!/bin/bash
#Package Installer script
#Versio 2.0
#Auther Naveed
#Company PredictifyMe
#Multiple package install at once if packages are not installed it will install


if [ $# -lt 1 ]; then 			#If total number of package is less than zero (if there is no argument passed you will get Usage message
echo "Usage: $0 package(s)"
exit 1
fi
while (($#)); do   # While loop will be executed the total number of arguments passed $# means total number of arguments passed
yum install "$1" << CONFIRM
y
CONFIRM
shift
done
