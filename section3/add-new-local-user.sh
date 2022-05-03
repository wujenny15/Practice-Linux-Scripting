#!/bin/bash

#  ./add-new-local-user.sh 1>std.out 2>std.err
# This script creates a new user on the local system.
# You must supply a username as an argument to the script.
# ./add-new-local-user.sh "peter2232" "account user creation"

# Make sure the script is being executed with superuser privileges.
if [[ $UID -ne 0 ]]
then
    echo "Please run with sudo or as root" 1>&2
    exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
NUMBER_OF_PARAMETERS="${#}"

if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} USERNAME [COMMENT]..." 1>&2
    echo "Create an account on the local system with the name of USERNAME and a comments first"
    exit 1
fi

# The first parameter is the user name.
USERNAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENT=${@}

# Generate a password.
PASSWORD="$(date +%s%N | sha256sum | head -c48)"

# Create the user with the password.
useradd -c "${COMMENT}" -m "${USERNAME}" &> /dev/null

# Check to see if the useradd command succeeded.
if [[ "$?" -ne 0 ]]; then
    echo "$?"
    exit 1
fi


# Set the password. 
echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Check to see if the passwd command succeeded.
if [[ "$?" -ne 0 ]]; then
    echo "The passwd for the account could not be set" >&2
    exit 1
fi

# Force password change on first login.
passwd -e ${USERNAME} &> /dev/null

# Display the username, password, and the host where the user was created.
echo "${USERNAME},${PASSWORD},${HOSTNAME}"
exit 0