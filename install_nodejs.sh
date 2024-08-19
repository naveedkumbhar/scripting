#!/bin/bash

#####
# Description: Script to remove old and install latest Node.js 
# Author: Naveed Ahmed
# Link: http://naveedkumbhar.com
#####

nodeVersion=`node -v`

Color_Off='\033[0m'
Color_Red='\033[0;31m'
Color_Green='\033[0;32m'
Color_Blue='\033[0;34m'
Color_Cyan='\033[0;36m'

echo -e "Current Node version is ${Color_Cyan}${nodeVersion}${Color_Off}"

# remove existing
echo -e "
${Color_Cyan}Removing Node-RED.. ${Color_Off}"
sudo apt-get remove nodered -y

echo -e "
${Color_Cyan}Removing Node.js... ${Color_Off}"
sudo apt-get remove nodejs nodejs-legacy -y

echo -e "
${Color_Cyan}Removing npm... ${Color_Off}"
sudo apt-get remove npm -y 

# install latest
#echo -e "
#${Color_Cyan}Downloading latest Node.js ARM-version.. ${Color_Off}"

echo -e "${Color_Cyan}Installing Node.js .. this will take a while .. ${Color_Off}"
sudo apt-get install nodejs

# cleanup
echo -e "
${Color_Cyan}Cleaning up .. ${Color_Off}"
sudo apt-get autoremove -y

# confirm version
echo -e "
${Color_Green}Successfully installed. Node.js version is: ${nodeVersion} 
${Color_Off}"
