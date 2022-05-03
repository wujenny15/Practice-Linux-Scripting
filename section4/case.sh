#!/bin/bash

# This script demonstrates the case statement

# if [[ "${1}" = 'start' ]]
# then
#     echo "Started"
# elif [[ "${1}" = 'stop' ]]
# then
#     echo "Stopped"
# fi

case "${1}" in
    start)
        echo "Started"
        ;;
    stop)
        echo "Stopped"
        ;;
   
    status|state)
        echo 'Status:'
        ;;
    *)
        echo "Supply a valid option"  >&2
        exit 1
        ;;
esac
