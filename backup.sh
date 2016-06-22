#!/bin/bash


## Author: Naveed
## Description: Create Backup of your directories, uploading it to s3 bucket, remove files from server.

one=filename.com.tar.gz
two=filename2.com.tar.gz
echo "Creating Backup $one $two..."
tar -cvzf $one /var/www/vhosts/filename.com/ &>/dev/null
tar -cvzf $two /var/www/vhosts/filename2.equiz.com/ &>/dev/null
if [ $? == 0 ]; then
echo "Backup $one $two Created successfully, Uploading to S3 Bucket"
else
echo "Failed"
fi
s3cmd put $one s3://yourbucketname/
s3cmd put $one s3://yourbucketname/
if [ $? == 0 ]; then
echo "Uploaded to S3 Bucket Successfully"
else
echo "Uploading to S3 Failed"
fi
echo "Removing $one $two"
sleep 1
rm -r $one $two
