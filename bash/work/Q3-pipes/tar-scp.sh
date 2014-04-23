#!/bin/bash

# Write a SINGLE LINE bash command to tar-gzip a particular
# sub-directory of the current directory (given as argument to the
# script), and copy the result to another machine, WITHOUT creating
# any new file in the source machine.

# Hint: you can execute an command on a remote machine using ssh.  For
# example, try "ssh <machine> ls".
function usage(){
	echo -n "Usage: "
	echo "sub-directory host@ip"
}

if ! [ $# -eq 2 ]; then
	usage
	exit 1
fi


tar -zcvf - $1|ssh $2 "cat > test.tar.gz"
