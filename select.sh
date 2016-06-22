#!/bin/bash -x
#Author Naveed
#Company PredictifyMe
#Purpose of this script: i
#Using select command (PS= Prompt Statement)

PS3="Select [1] for searching files, [2] for Directories, [3] for exit "
select i in file directory exit
do
case $i in
file)
echo "Enter the path you want to search for directories/folders in it"i
read dir
if [ -d $dir ]; then
ls -la $dir | grep ^-
total=`ls -la $dir | grep ^- | wc -l`
echo "Total numbers of files is $total"
else
echo "Wrong Path"
fi;;
directory)
echo "Enter the path you want to search for directories/folders in it"
read dir
if [ -d $dir ] ;then
ls -la $dir | grep ^d
total=`ls -la $dir | grep  ^d | wc -l`
echo "Total numbers of Directories/Folders is $total"
else
echo "Wrong path"
fi;;
exit) exit;;
esac
done
