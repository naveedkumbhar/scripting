#!/bin/bash -x
# Author: Naveed
# Company: DigitalOcean
# Purpose of this script:
# This script allows the user to search for files or directories within a specified path.
# It uses the 'select' command for an interactive menu with a prompt statement (PS).

PS3="Select [1] for searching files, [2] for directories, [3] for exit: "

select i in file directory exit
do
  case $i in
    file)
      echo "Enter the path you want to search for files in:"
      read dir
      if [ -d $dir ]; then
        ls -la $dir | grep ^-
        total=$(ls -la $dir | grep ^- | wc -l)
        echo "Total number of files: $total"
      else
        echo "Invalid path"
      fi
      ;;
    directory)
      echo "Enter the path you want to search for directories/folders in:"
      read dir
      if [ -d $dir ]; then
        ls -la $dir | grep ^d
        total=$(ls -la $dir | grep ^d | wc -l)
        echo "Total number of directories/folders: $total"
      else
        echo "Invalid path"
      fi
      ;;
    exit)
      exit
      ;;
    *)
      echo "Invalid option. Please select a valid option."
      ;;
  esac
done

