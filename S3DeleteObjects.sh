#!/bin/bash
# Description
# The script ensures that the user provides valid arguments, constructs the correct S3 bucket path, lists files in the bucket, and deletes files older than the specified time period. The checks and validations help avoid common mistakes, such as including unnecessary prefixes or slashes in the bucket name.

usage (){
  echo " "
  echo Usage: s3-del-old "bucketname" "time"
  echo Example: s3-del-old \"mybucket\" \"30 days\"
  echo " "
  echo "Do not include a leading slash in bucketname."
  echo " "
}

# if incorrect # parameters, show usage
if [ $# -lt 2 ]; then
  usage
  exit 2
elif [ $# -gt 2 ]; then
  usage
  exit 2
fi

# don't allow leading slash in bucketname
firstchar=${1:0:1}
if [ $firstchar = "/" ]; then
  echo "ERROR: Do not start bucketname with a slash.."
  usage
exit 2
fi

# don't allow "s3:" in beginning of filename
teststring=${1:0:3}
teststring=${teststring,,}
if [ $teststring = "s3:" ]; then
  echo "ERROR: Do not start bucketname with \"s3:\""
  usage
exit 2
fi

# transform first parameter into fully formed s3 bucket parameter with trailing slash star
target='s3://'${1%/}'/*'

s3cmd ls $target | while read -r line;
do
  create_date=`echo $line | awk '{print $1,$2}'`
  create_date_unixtime=`date -d"$create_date" +%s`
  older_than_unixtime=`date -d"-$2" +%s`
  if [[ $create_date_unixtime -lt $older_than_unixtime ]]
  then
    filename=`echo $line|awk '{print $4}'`
    if [[ $filename != "" ]]
    then
      echo deleting $filename $create_date
      s3cmd del $filename
    fi
  fi
done;
