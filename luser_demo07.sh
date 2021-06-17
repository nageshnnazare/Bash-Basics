#!/bin/bash

# USe of shift cmd and while loop


# display first 3 parameters
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo

# loop through all the positional parameters
while [[ "${#}" -gt 0 ]]
do
	echo "Number fo parameters: ${#}"
	echo "Parameter 1: ${1}"
	echo "Parameter 2: ${2}"
	echo "Parameter 3: ${3}"
	echo
	shift 
done 
