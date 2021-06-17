#!/bin/bash

# learning about getopts

# this script generates the password randomly
# set passwd length by -l
# add a special character with -s
# Verbose mode with -v

Usage (){
	echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
	echo 'Generate a random passwd.'
	echo '-l	Specify the passwd length'
	echo '-s	Append a special character to passwd'
	echo '-v 	Increase Verbosity'
	exit 1
}

log (){
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" == 'true' ]]
	then
		echo  "${MESSAGE}"
	fi
}

# set default passwrd length
LENGTH=48

while getopts vl:s OPTION
do
	case ${OPTION} in
		v) 	VERBOSE='true'
			log 'Verbose mode ON...'
			;;
		l)	LENGTH="${OPTARG}"
			;;
		s)	USE_SPECIAL_CHAR='true'
			;;
		?)	Usage
			;;
	esac
done

#echo "Number of args: ${#}"
#echo "All args: ${@}"
#echo "First arg: ${1}"
#echo "Second arg: ${2}"
#echo "Third arg: ${3}"

# inspect OPTIND
echo "OPTIND: ${OPTIND}"

# remove the options while leaving remaining args
shift "$(( OPTIND -1 ))"

#echo "After Shifting"
#echo "Number of args: ${#}"
#echo "All args: ${@}"
#echo "First arg: ${1}"
#echo "Second arg: ${2}"
#echo "Third arg: ${3}"

if [[ "${#}" -gt 0 ]]
then
	Usage
fi

log 'Generating a password...'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# appending the special character
if [[ "${USE_SPECIAL_CHAR}" = 'true' ]]
then
	log 'Selecting a random special character...'
	SPECIAL_CHAR=$(echo '!@#$%^&*()+-=' | fold -w1 | shuf | head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHAR}"
fi

log 'DONE !!!'

log 'Here is your Password :'
echo ${PASSWORD}

exit 0


