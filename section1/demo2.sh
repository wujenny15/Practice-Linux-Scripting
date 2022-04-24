#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not

# Display the UID
echo "Your UID is ${UID}"
# UID can't be changed
# UID="1001"

# Display the username
# USER_NAME=$(id -un)
USER_NAME=`id -un`
echo "Your username is ${USER_NAME}"

# Display if the user is the root user or not
id -u -n
id -n -u
id -nu

if [[ "${UID}" -eq 0 ]]
then
    echo 'You are root.'
else
    echo 'You are not root.'
fi


# display the user id
whoami