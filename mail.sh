#!/bin/bash
#
# Executes the script given as argument #2,
# then if there is anything printed to stdout,
# it will email the text as the body of the email
# 
# &copy; Michael Craze -- http://projectcraze.us.to

if [ "$#" -ne 2 ] ; then
	echo "Usage: $0 <subject> <script>"
	exit
fi

EMAIL="username@example.com"
SUBJECT=$1
SCRIPT=$2
MAIL=`which mail`
BODY=`$SCRIPT`

# send email if something was posted today
if [ -n "$BODY" ] ; then
	echo $BODY | $MAIL -s $SUBJECT $EMAIL
fi
