#!/bin/bash

# Define MySQL host, user, and password
host='yourhost'
user='yourdbusername'
password='yourdbpassword'

# Directory to store the MySQL backups
directory=/var/www/mysqlbackup

# Backup filename prefix
backup=all-database.tar.gz

# Get the list of all databases excluding 'Database' and schemas
dbs=$(mysql -h $host -u $user -p$password -e "SHOW DATABASES;" | tr -d "| " | grep -v -E "Database|schema")

# Loop through each database and create a dump
for db in $dbs; do
  echo "Dumping database $db"
  # Dump the database into the specified directory
  mysqldump --events -h $host -u $user -p$password --databases $db > $directory/$db.sql
done

# Create a timestamp
TIME=$(date +%Y%m%d)

# Compress all database dumps into a single tar.gz file
tar -czvf $TIME.$backup $directory

# Upload the compressed backup file to an S3 bucket using s3cmd
s3cmd put $TIME.$backup s3://bucketname

# Clean up: remove the compressed backup file and the directory containing individual SQL files
rm -r $TIME.$backup $directory

# Ensure the backup directory exists for future backups
mkdir -p $directory

