#!/bin/bash

log(){
    # This function sends a log message to syslog and to standard output if VERBOSE is true
    local VERBOSE="${1}"
    shift
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${MESSAGE}"
    fi
    logger -t function.sh "${MESSAGE}"
}

backup_file(){
    # This function creates a backup file. Returns non-zero status on error.
    local FILE="${1}"

    # Make sure the file exits
    if [[ -f "${FILE}" ]]
    then
        local BACKUP_FILE="/VAR/TMP/$(basename ${FILE}).$(date +%F-%N)"
        log "Backing up ${FILE} to ${BACKUP_FILE}."

        # The exit status of the function will be the exit status of the cp command
        cp -p ${FILE} "${BACKUP_FILE}"
    else
        #The file does not exist, so return a non-zero exit status
        return 1
    fi
}

VERBOSITY='true'
log 'true' 'Hello!'
log "${VERBOSITY}" 'This is fun!'

# readonly VERBOSE="true"
log "Hello"

# backup_file '/etc/passwd'

if [[ "${?}" -eq 0 ]]
then
    log 'File backup succeeded!'
else
    log 'File backup failed!'
    exit 1
fi