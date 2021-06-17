#!/bin/bash

# GENERATES RANDOM PASSWORDS

# A RANDOM NUMBER AS PASSWORD...
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use current time as password
PASSWORD=$(date +%s)
echo "${PASSWORD}" 

# Use nanosec as password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# Cyptographic hash functions
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# an even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Append special character to the password
SPECIAL_CHAR=$(echo '!@#$%^&*()_-+' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHAR}"
