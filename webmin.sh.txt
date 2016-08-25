#!/bin/bash
#Author: Naveed
#dated: 25/08/2016
publicip=`curl -s http://whatismijnip.nl |cut -d " " -f 5`
echo "WebMin Installation script"
echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
echo "Please wait.... Updating Repositories"
sudo apt-get update &>/dev/null
sudo apt-get install webmin -y
if [ $? == 0 ]; then
echo "You can open from here: https://$publicip:10000"
else
echo "Installation failed, Please Try manual installation"
fi
