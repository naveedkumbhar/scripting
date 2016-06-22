#!/bin/bash
#ScriptName: DirectorySize
#Author: Naveed Ahmed
#Company: PredictifyMe

echo "Enter the directory you want to know the size: "
read dir
size="`du -ch $dir | grep total | awk '{print $1}'`"
echo "Total size of $dir is $size"


