#!/bin/bash
#LINE EDITOR V1.0
#Author: Naveed Ahmed | Linux expert | Deployment Engineer
#Company: DigitalOcean
#Status: Incomplete Working on this script for making it more easy for end users.
#Critics and feedbacks are highly welcomed mailto: naveed_kumbhar@hotmail.com

# To-Dos
#1: save file algorithm 
#2: read that same file algorithm
#3: Remove blank lines
#4: Remove blank spaces
#5: sort by name
#6: Remove duplicates
#7: sort lines
#8: Valid domain
#   _     _              _____    _ _ _             
#  | |   (_)_ __   ___  | ____|__| (_) |_ ___  _ __ 
#  | |   | | '_ \ / _ \ |  _| / _` | | __/ _ \| '__|
#  | |___| | | | |  __/ | |__| (_| | | || (_) | |   
#  |_____|_|_| |_|\___| |_____\__,_|_|\__\___/|_| version 1.0  
                                                 

echo "Line editor for linux Using RegEx"
PS3="Select [1] for removing string, [2] Add string at the end of line, [3] add string from the beggening of line, [4] Replace the string, [5] exit: "
select i in remove end start replace exit
do
case $i in
remove)
echo "Remove string from the line"
echo
read -p "Insert exact file location you want to edit ex:/home/niddu/Desktop/file: " file
if [ -f $file ]; then
read -p "Insert the string you want to remove: " text
sed "s/$text//" $file
#################################################
function save ()
{
read -p "Type [s] to save the file: " s
if [ $s == "s" ]; then
sed "s/$text//" $file >> $file
if [ $? == 0 ]; then
echo "File saved!"
read -p "Type [r] to read the file: " r
if [ $r == "r" ]; then
cat $file
fi
fi
fi
}
save
#################################################
else 
echo "$file does not exists"
fi;;
end)
echo "Add string to the end of line" 
echo
read -p "Insert exact file location you want to edit ex:/home/niddu/Desktop/file: " file
if [ -f $file ]; then
read -p "Insert the text you want to add at the end of line it will be like : /naveed.html: " text
sed "s/$/\/$text/" $file
else
echo "$file Does not exists"
fi;;
start)
echo "Add string from the begening"
echo
read -p "Insert exact file location you want to edit ex:/home/niddu/Desktop/file: " file
if [ -f $file ] ; then
read -p "Insert the string you want to add from the begening" text
sed "s/^/$text/" $file
else
echo "$file does not exist"
fi;;
replace)
echo "Replace the string"
echo
read -p "Insert exact file location you want to edit ex:/home/niddu/Desktop/file: " file
if [ -f $file ];then
read -p "Text you want to change: " change
read -p "String you want to replace with $change: " text
sed "s/$change/$text" $file
else
echo "$file does not exists"
fi;;
exit) exit;;
esac
done
