#!/bin/bash

# Script for creating the local account on the system
# Prompt for account name and password


# Ask for user name
read -p 'Enter the username to create: ' USER_NAME

# Ask for real name
read -p 'Enter the name of the person: ' COMMENT

# Ask for password
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password change on first login
passwd -e ${USER_NAME}

