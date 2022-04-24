#!/bin/bash

# This script displays various information to the screen

# Display 'Hello'
echo "Hello"

# Assign a value to a variable 
WORD='script'

# Display that value using the variable.
echo "$WORD"

# Demonstrate that single quptes cause variables to NOT get expanded
# If we want the variable to not be changed, use single quote
# If we want the variable be interpreted or expanded, use double quote
echo '$WORD'

# combine the variable with hard-coded text
echo "This is a shell $WORD"

# Display the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

# Append text to the variable.
echo "${WORD}ing is fun!"

# Create a new variable
ENDING='ed'

# Combine the two variables.
echo "This is ${WORD}${ENDING}"

# Change the value stored in the ENDING variable. (Reassignment)
ENDING='ing'
echo "${WORD}${ENDING} is fun!"

