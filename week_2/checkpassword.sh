#!/bin/bash
# Function: check if the password is secure enough
#           and according a specific pattern

echo -n "New password? "
read -s password

[[ ${#password} -lt 8 ]] && { echo "Password invalid"; exit 1; }
regex="^[A-Z]+.*[0-9]{2}$"
[[ $password =~ $regex ]] || { echo "Password invalid"; exit 1; }
echo "Password valid"; exit 0;
