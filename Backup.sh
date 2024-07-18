#!/bin/bash
# Author: Naveed
# Company: PredictifyMe
# Script purpose: Create a local backup of web data and transfer it to a remote server
# Version: 2.0

# Set variables
BACKUPHOST="tempuser@192.0.2.0:/home/tempuser/Desktop/"
BACKUPDIR="/tmp/backup/"
DATA="/var/www/*"
BACKUPFILE="backup.$(date +%F).tar.gz"
CRONJOB="0 9,13 * * * /bin/bash /home/tempuser/Desktop/test/backup.sh"

# Function to set up a cron job for scheduling the backup task
setup_cron() {
  echo "Setting up cron job..."
  echo "$CRONJOB" > task.txt
  crontab task.txt
  rm task.txt
  echo "Cron job set to run at 9 AM and 1 PM daily."
}

# Function to create a backup directory
create_backup_dir() {
  echo "Creating backup directory in /tmp..."
  mkdir -p $BACKUPDIR
  echo "Backup directory created at $BACKUPDIR."
}

# Function to create a backup
create_backup() {
  echo "Creating backup... Please wait"
  tar -czvf $BACKUPDIR/$BACKUPFILE -P $DATA 1>/dev/null
  echo "Backup created at $BACKUPDIR/$BACKUPFILE."
}

# Function to transfer backup to remote server
transfer_backup() {
  echo "Transferring backup to remote server..."
  scp $BACKUPDIR/$BACKUPFILE $BACKUPHOST
  if [ $? -eq 0 ]; then
    echo "Backup has been created and transferred successfully" | tee -a /tmp/backup/back-up-notification.txt
  else
    echo "Backup transfer failed"
  fi
}

# Main script execution
main() {
  setup_cron
  create_backup_dir
  create_backup
  transfer_backup
}

# Run the main function
main

# END

