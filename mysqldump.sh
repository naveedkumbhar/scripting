#!/bin/bash
host='yourhost'
user='yourdbusername'
password='yourdbpassword'
directory=/var/www/mysqlbackup
backup=all-database.tar.gz
dbs=`mysql -h $host -u $user -p$password -e "SHOW DATABASES;" | tr -d "| " | grep -v Database | grep -v schema`
for db in $dbs; do
echo "Dumping database $db"
mysqldump --events -h $host -u $user -p$password --databases $db > $directory/$db.sql
done
#tar -czvf $TIME.$backup $directory
#s3cmd put `date +%Y%m%d`.$backup s3://bucketname
#rm -r `date +%Y%m%d`.$backup $directory
