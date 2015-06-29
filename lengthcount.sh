#!/bin/bash
#scriptname lengthcount
#purpose    it will count the length of variable
#author     Naveed
#Company    Predictify.Me


echo "Enter the value you want to count the characters used in"
read niddu
totalchar=`echo ${#niddu}`
echo "Length of $niddu is $totalchar"


#END
