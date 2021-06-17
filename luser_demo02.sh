#!/bin/bash

# DISPLAY THE UID OF THE USER EXECUTING THIS SCRIPT
# DISPLAY IF THE USER IS THE ROOT OR NOT

# Display UID
echo "Your UID is ${UID}"

# Display the username
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

USER_NAME=`id -un`
echo "Your username is ${USER_NAME}"

# Display if the user is root or not
if [[ "${UID}" -eq 0 ]]
then
 echo 'You are root'
else
 echo 'You are not root'
fi



