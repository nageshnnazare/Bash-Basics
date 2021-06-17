#!/bin/bash

# Functions

# this function sends a message to syslog,  and to stdout if VERBOSE is 'true'
log () {
#	local VERBOSE="${1}"
#	shift
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" == 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t luser_demo11.sh "${MESSAGE}"
}
# check log messages in /var/log/messages

readonly VERBOSE='true'
#log 'Hello..!'

#log 'true' 'Hello!'
#log 'true' 'This is fun!' 'cool..'

#-------------------------------------------------------------------

# this function creates a backup of a file. returns non-zero status on error 
backup_file() {
	local FILE="${1}"

	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
		log "Backing up ${FILE} to ${BACKUP_FILE}"

		cp -p ${FILE} ${BACKUP_FILE}
	else
		# file doesnt exists
		return 1
	fi
}

#------------------------------------------------------------------

backup_file '/etc/passwd'

# make decision based on exit status
if [[ "${?}" -eq '0' ]]
then
	log 'File Backup succeeded!'
else
	log 'File Backup failed!'
	exit 1
fi


