#!/bin/bash

# Demonstrates IO redirection

# Redirect STDOUT ot a file
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# Read STDIN 
read LINE < ${FILE}
echo "Line contains ---> ${LINE}"

# Redirect STDOUT to a file
head -n3 /etc/passwd > ${FILE}
echo
echo "Content of the file : ${FILE}:"
cat ${FILE}

# Redirect STDOUT to a file, appending to the file
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of the appended file ${FILE} :"
cat ${FILE}

