#!/bin/bash
#Purpose = Backup of Important Data
#Created on 20/12/2016
#Author = Naveed Ahmed
#Version 1.0
#START
MONTH=`date +%B`
TIME=`date -I`          # This Command will add date in Backup File Name.
FILENAME=backup-$TIME.tar.gz     # Here i define Backup file name format.
SRCDIR=/var/www/                  # Location of Important Data Directory (Source of backup).
DESDIR=/root/backup                   # Destination of backup file.
SNF=/var/www/$MONTH          # Snapshot file name and location
tar -cvf $DESDIR/$FILENAME -g $SNF.snap $SRCDIR  #Backup Command
s3cmd put /root/backup/$FILENAME s3://s3-bucketname/
#END
