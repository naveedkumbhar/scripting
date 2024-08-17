# Bash Scripting
# Author Naveed Ahmed
# I will put all my scripts here now and in future too
# email: naveed_kumbhar@hotmail.com 
# Last update: 08/17/2024
# Company DigitalOcean

#1: GitPush.sh
- This utility is need of the time, specifically when you are working frequently through terminal and make changes in files / code with this utility you can quickly push the code to repository rest this script will handle it. 

Usage example:
gitpush "commit name"
if your current branch is set to master it wont push ( for the safe side to not push in master directly ) maybe that is connected to pipeline and so many other reasons.


#2: time.sh

- The script expects exactly one argument that represents a date and time in a specific format.
- If the script does not receive exactly one argument, it prints instructions on how to provide the correct date and time format.
- If the script receives exactly one argument, it attempts to set the system date and time using the provided argument.

- Usage Example
If you run the script with the argument 122409532014.00, it interprets this as:

12 - Month (December)
24 - Day
09 - Hour
53 - Minute
2014 - Year
.00 - Second

./TimeChange.sh 122409532014.00


#3 GeneratePassword.sh 

Explanation:
 - The display_help function provides a usage message to guide the user.
- If no arguments are provided ($# -eq 0), the script displays the help message and exits with status 1.
- The script checks if the provided argument is a number using a regular expression ([[ $1 =~ ^[0-9]+$ ]]).
- If the argument is not a number, it prints an error message, displays the help menu, and exits with status 1.
- If a valid length is provided, it generates a random password using openssl and prints it.
- You can save this script as GeneratePassword.sh, make it executable, and run it with the desired password length as an argument:

chmod +x GeneratePassword.sh
./GeneratePassword.sh 14

#4 CPUAlert.sh

This script installs a cron job to run itself every minute. It checks for CPU utilization and if CPU utilization is greater than 50%, it sends an email with a high CPU utilization message.
Prerequisites: You must have Postfix or Exim installed as an outgoing mail server.
Note: Edit the cron job according to your requirements.


#5 ResourceMonitoring.sh
This script start monitoring the system resources i.e memory cpu disk and write it to some file. you can add this script in cron for continues monitoring the resources

#6 NotificationSend.sh
This script is basically a reminder script or to send notification on screen this is helpful in many cases specially with scripting

#7 WebMin.sh

This script will install latest webmin package on debian based OS

#8 IPtablesScript.sh
This script will add/create common IPTABLES rules 

#9 RestoreDB.sh

This script will restore the database into MySQL by providing user and password


#10 S3DeleteObjects.sh
d time period. The checks and validations help avoid common mistakes, such as including unnecessary prefixes or slashes in the bucket name.ied time period. The checks and validations help avoid common mistakes, such as including unnecessary prefixes or slashes in the bucket name.

#11 MySQLDump.sh

This script is used for creating MySQL backup and can be scheduledd through cron jobs

#12 LengthCount.sh
This script prompts the user to enter a value and then calculates and displays the length of the input.

#13 .conkyrc

This is conky configuration used for customized widget on desktop screen

#14 DirectorySize.sh

This script will take input of the directory and return the size of that directory

#15 .vimrc

This is customized vimrc configuration file for vim ( editor ) 
