#!/bin/bash

# This script displays variious information to the screen

# Display the text below
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display the value of the variable
echo "$WORD"

# Demonstrate that single quotes are not interpreted
echo '$WORD'

# combining multiple
echo "This is a shell $WORD"

# display the contents of the variables using alternative syntax
echo "This is a bash ${WORD}"

# append text to variable (use braces)
echo "${WORD}ing is FUN!!"

# this doesnt work!!
echo "$WORD-ing is fun"

# New variable
ENDING='ed'

# combineing two variable
echo "This is ${WORD}${ENDING}."

# Changing the value stored / reassignment
ENDING='ing'
echo "${WORD}${ENDING} is fun..."

# reassignment
ENDING='s'
echo "You are gonna write many ${WORD}${ENDING}"


