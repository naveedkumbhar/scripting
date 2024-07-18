#!/bin/bash
# Purpose: Backup of Important Data and upload to S3
# Created on: 20/12/2016
# Last modified: 16/07/2024
# Author: Naveed Ahmed
# Version: 1.0

# START

# Get the current month and date
MONTH=`date +%B`
TIME=`date -I`  # This command will add the current date in the backup file name.

# Define the backup file name format
FILENAME=backup-$TIME.tar.gz

# Define the source directory for important data (source of backup)
SRCDIR=/var/www/

# Define the destination directory for the backup file
DESDIR=/root/backup

# Define the snapshot file name and location
SNF=/var/www/$MONTH

# Create the destination directory if it doesn't exist
mkdir -p $DESDIR

# Create a backup of the source directory
# -c: Create a new archive
# -v: Verbosely list files processed
# -f: Use archive file
# -g: Handle incremental backups
tar -cvf $DESDIR/$FILENAME -g $SNF.snap $SRCDIR

# Check if the backup command was successful
if [ $? -eq 0 ]; then
  echo "Backup created successfully: $DESDIR/$FILENAME"
else
  echo "Backup failed"
  exit 1
fi

# Upload the backup file to S3 using s3cmd
s3cmd put $DESDIR/$FILENAME s3://s3-bucketname/

# Check if the upload command was successful
if [ $? -eq 0 ]; then
  echo "Backup uploaded to S3 successfully: s3://s3-bucketname/$FILENAME"
else
  echo "Failed to upload backup to S3"
  exit 1
fi

# END

