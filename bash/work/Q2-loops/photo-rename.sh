#!/bin/bash

function usage(){
	echo -n "Usage: "
	echo $0" directory"
}

function renamePhoto(){
	oldIFS=IFS
	IFS=$(echo -en "\n\b")
	for i in `ls $1`
	do
		if [[ $i =~ ^[0-9]{8,8}.*\.jpg$ ]]; then
			day=${i:0:2}
			month=${i:2:2}
			year=${i:4:4}
			fileName=${i%.jpg}
			any=${fileName:8}
			newName="$year-$month-$day"
			if ! [ `expr length $fileName` -eq 8 ]; then
				newName=$newName"-$any"
			fi
			newName=$newName".jpg"
			echo -en $i"\t->\t"$newName
			mv $i $newName
			if [ $? -eq 0 ]; then
				echo " successful!"
			else
				echo " failed!"
			fi
		fi
	done
}

if [ $# -eq 0 ]; then
	usage
	exit 1
elif ! [ -d $1 ]; then
	echo "Directory invalid!"
	exit 2
fi

renamePhoto $1
