#!/bin/bash

# This script generates a list of random passwords.

# A random password as a password.
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use the current date/time as the basis for the password
PASSWORD="$(date +%s)"
echo "${PASSWORD}"

# Use nanoseconds to act as randomization
PASSWORD="$(date +%s%N)"
echo "${PASSWORD}"

# Get a random special character
S='!@#$%^&*()_-+='
echo "${S}" | fold -w1 | shuf | head -c1

# Append a special character to the password.
SPECIAL_CHARACTERS=$(echo "${S}" | fold -w1 | shuf | head -c1)