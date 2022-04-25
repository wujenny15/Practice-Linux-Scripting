#!/bin/bash

if [[ "$UID" -ne 0 ]]
then
    echo "Please run with sudo or as root."
    exit 1
fi

# Get the usernmae(login)
read -p 'Enter the username to create: ' USERNAME

# Get the realname (contents for the description field)
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Get the password.
read -p 'Enter the password to use for the account ' PASSWORD

# Create the user.
useradd -c "${COMMENT}" -m "${USERNAME}"

# Check to see if the useradd command succeeded
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
    echo "The account could not be created"
    exit 1
fi

# Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USERNAME}
if [[ "${?}" -ne 0 ]]
then
    echo "The password for the account could not be set."
    exit 1
fi

# Force password change on first login
password -e ${USERNAME}

# Display the username, password and host where the user was created.
echo
echo 'username:'
echo "${USERNAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"

exit 0