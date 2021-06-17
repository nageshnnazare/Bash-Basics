#!/bin/bash

# FILE Descriptors : 0 -> INPUT....... 1 -> OUTPUT......  2 -> ERROR......

FILE="/tmp/ampersand"

# redirect STDIN using FD 0
read LINE 0< ${FILE}
echo
echo "LINE contains: ${LINE}"

# redirect STDOUT using FD 1, overwriting it
head -n3 /etc/passwd 1> ${FILE}
echo 
echo "Contents of ${FILE}"
cat ${FILE}

# redirect STDERR using FD 2
ERR_FILE="/tmp/data_err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

# redirect STDOUT and STDERR to a file
head -n3 /etc/passwd /fakefile &> ${FILE}
echo 
echo "Contents of ${FILE}"
cat ${FILE}

# redirect STDOUT and STDERR through a pipe
echo
head -n3 /etc/passwd /fakefile |& cat -n

# send output to STDERR
echo "This is STDERR!" >&2

# Discard STDOUT
echo 
echo "Discarding STDOUT..................."
head -n3 /etc/passwd /fakefile > /dev/null

# discard STDERR
echo
echo "Discarding STDERR..................."
head -n3 /fakefile 2> /dev/null

# Discard both
echo 
echo "Discarding STDOUT and STDERR........" 
head -n3 /fakefile &> /dev/null

# clean up
rm ${FILE} ${ERR_FILE} &> /dev/null



 
