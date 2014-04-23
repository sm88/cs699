#/bin/bash

# This program should compile the latex file given as argument, a tex
# file assumed to be in the current/working directory.  And if the
# latex compilation succeeds, it should tar-gzip the entire current
# directory (from the current directory) to a tgz file called
# paper.tgz.  It should then move the paper.tgz file to /tmp.

function usage(){
	echo -n "Usage: "
	echo $0" filename"
}

function compile(){
	latex -halt-on-error -interaction=batchmode $1>&/dev/null
	if ! [ $? -eq 0 ]; then
		echo "Compilation failed!"
		exit 1
	fi
}

function tarAndMove(){
	tar -czvf paper.tgz .>&/dev/null
	mv paper.tgz /tmp/
}

if ! [ $# -eq 1 ]; then
	usage
	exit 1
fi

compile $1
tarAndMove
