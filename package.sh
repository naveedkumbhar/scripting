#!/bin/bash
#Auto Package installer
#Author: Naveed Ahmed
#PredictifyMe

#Info: This script will use input as argument passed to this script
#It will install the package if argument passed to this script as package name is not installed


if [ $(whoami) != "root" ] ; then 		#Only Root user can execute this script
echo "You're not root, please switch to root user and then run this script"
else
echo "Package Installer script"
echo "To install the package just type the name of package"
echo "for Example: $0 package name | scriptname.sh python"
rpm -q $1  					#$1 is Positional Paramater used as argument number 1, we can add more arguments $2,$3 and so on.,..
if [ $? == 0 ]; then
echo "Package $1 is already installed"
else
if [ $? == 1 ]; then
echo "Installing $1 package"
sleep 1
yum -y install $1 &>/dev/null
if [ $? == 0 ]; then
echo "`rpm -q $1` is installed"
fi
fi
fi
fi
