#!/bin/bash
#Script: Package Installer
#Author: Naveed Ahmed
#Company: PredictifyMe


#Info about script: it will take input from command line for packages
#If package is installed it will ignore
#If package is not installed it will start installing packages mentioned in using standard input


echo "Enter the package name you want to install"

read a b
# if $a (probably package name) is not installed, exit status will be 1 then it will start installing package 

rpm -q $a &>/dev/null 			# it will send stdout stderr to /dev/null after that if exit status is 1 it will execute yum for installing package
if [ $? == 1 ]; then
echo "installing $a"
echo "Installing...."
sleep 1
yum -y install $a &>/dev/null
else 
echo "`rpm -q $a` is installed"         #This will execute the command rom -q $varname to make sure if it is installed
fi

rpm -q $b &>/dev/null
if [ $? == 1 ]; then
echo "installing $b"
echo "Installing...."
sleep 1
yum -y install $b &>/dev/null
else
echo "`rpm -q $b` is installed"
fi


