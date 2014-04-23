#!/bin/bash

# Write a script called photo-dates.sh which takes one argument, a
# photo file, and prints the file's orignal date and time of creation.
# The format of the output can match the relevant line in the output
# of the 'identify' program.  Hint: use the verbose option for the
# identify program.
function usage(){
	echo -n "Usage: "
	echo $0" filename"
}

if ! [ $# -eq 1 ]; then
	usage 
	exit 1
fi

identify -verbose $1|grep date:create
