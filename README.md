# Bash Scripting
# Author Naveed Ahmed
# I will put all my scripts here now and in future too
# email: naveed_kumbhar@hotmail.com 


#1: gitpush
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


#3

Explanation:
 - The display_help function provides a usage message to guide the user.
- If no arguments are provided ($# -eq 0), the script displays the help message and exits with status 1.
- The script checks if the provided argument is a number using a regular expression ([[ $1 =~ ^[0-9]+$ ]]).
- If the argument is not a number, it prints an error message, displays the help menu, and exits with status 1.
- If a valid length is provided, it generates a random password using openssl and prints it.
- You can save this script as GeneratePassword.sh, make it executable, and run it with the desired password length as an argument:

chmod +x GeneratePassword.sh
./GeneratePassword.sh 16
