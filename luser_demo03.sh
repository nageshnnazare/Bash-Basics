#!/bin/bash

# DISPLAY USERNAME & UID OF THE USER EXECUTING THIS SCRIPT
# DISPLAY IF THE USER IS VAGRANT USER OR NOT

# Display UID
echo "Your UID id ${UID}"

# only display if the uid doesnt match 1000
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
	then echo "Your UID doesnt match ${UID_TO_TEST_FOR}"
	#exit 1
fi  

# display the username
USER_NAME=$(id -un)

# Test is the command succeded
if [[ "${?}" -ne 0 ]]
	then echo "The id command did not execute successfully!"
	#exit 1
fi

echo "Your Username is ${USER_NAME}"

# string text conditional
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
	then echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
fi

# test for not equal 
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
	then echo "Your Username does not match ${USER_NAME_TO_TEST_FOR}"
	exit 1
fi


exit 0
