#/bin/bash

# This program should compile the latex file given as argument.  The
# tex file can be in any directory; its full path name or relative
# path name may be given as argument.  And if the latex compilation
# succeeds, it should tar-gzip the entire directory in which the latex
# file resides, from the parent directory, to a tgz file.  The name of
# the tgz file should be <dirname>.tgz where <dirname> is the name of
# the directory in which the latex file resides.  It should then move
# the tgz file to /tmp.

function usage(){
	echo -n "Usage: "
	echo $0" filename"
}

function compile(){
	if ! [ -f $CANPATH ]; then
		echo "File does not exist!"
		exit 2
	fi

	directory=$(dirname $CANPATH)
	tarName=$(basename $directory).tgz
	
	latex -halt-on-error -interaction=bacthmode -output-directory=$directory $CANPATH>&/dev/null
	
	if ! [ $? -eq 0 ]; then
		echo "Compilation failed!"
		exit 3
	fi
	pushd $directory>&/dev/null
	tar -czvf $tarName .>&/dev/null
	popd>&/dev/null
	mv $directory/$tarName /tmp/
}

if ! [ $# -eq 1 ]; then
	usage
	exit 1
fi

CANPATH=$(readlink -en $1)
compile
