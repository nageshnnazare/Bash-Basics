#!/bin/bash

# Create password for each user on the command line

# Display what the user typed on the cmd line
echo "You executed this command: ${0}"

# Display the path and file name of the script
echo "You used $(dirname ${0}) as the path to the $(basename ${0})"

# how any arg they passed in
# (Inside the script they are parameters and outside they are args)
NO_OF_PARAMS="${#}"
echo "You supplied ${NO_OF_PARAMS} arg(s) on the shell"

# Make sure they supply atleast one arg
if [[ "${NO_OF_PARAMS}" -lt 1 ]]
	then echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi

# Generate and display the password fo each parameter
for USER_NAME in "${@}"
do 
	PASSWORD=$(date +%s%N | sha256sum | head -c32)
	echo "${USER_NAME}: ${PASSWORD}"
done  
