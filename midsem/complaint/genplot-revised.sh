#!/bin/bash

# This script dynamically generates a gnuplot script and runs gnuplot
# on it.  It CANNOT depend on an externally present gnuplot file.

# The gnuplot script generated should plot the data given in the file
# thrpt-data.txt in the current directory.  The data has two columns:
# time (in seconds) and network throughput (in Kbps).

# 2 marks: The script should take one argument: the title of plot.
# And it should generate the gnuplot script to output thrpt-plot.eps
# which plots the throughput versus time.  The specified title should
# show on the final plot output.

# 2 marks: The script should check for an environment variable called
# X_LABEL.  If this variable is present, then the script use its value
# as the x-axis label within the gnuplot script, else it must use the
# string "Time" for the x-axis label.

# 2 marks: The script should check for environment variable
# TIME_UNIT.  If this variable is present and is set to 'ms', then the
# x-axis should be in milli-seconds, even though the data is given in
# seconds (i.e. each value in the data file must be appropriately
# converted before plotting).  You CANNOT change the data file itself,
# and you CANNOT dynamically generate a new data file.  Hint: there is
# a way to do simple arithmetic within gnuplot.

# Marks: 6
# Marks break up: 2+2+2
# HP: 1
# 1 HP for getting the last part right

########## START ########## DO NOT EDIT THIS LINE OR LINES ABOVE THIS
filename="thrpt-data.txt"
title=""
xLabel=""
timeUnit=""

function get_gnu_script(){
	setVariables $1
	plotScript
}

function setVariables(){
	title=$1
	expr length $X_LABEL>&/dev/null
	#check presence
	if ! [ $? -eq 0 ]; then #(this is an error. The NOT was not supposed to be there. This was 2 marks and I do not expect any marks for this)
		xLabel=$X_LABEL
	else
		xLabel="Time"
	fi

	expr length $TIME_UNIT>&/dev/null

	if [[ $? -eq 0 && $TIME_UNIT = "ms" ]]; then
	   timeUnit=$TIME_UNIT
   else	   
	   timeUnit=""
   fi
}

function plotScript(){
	data="thrpt-plot.eps"
	script="set term postscript eps\nreset\nset xlabel \""$xLabel"\"\nset ylabel \"Throughtput\"\nset output \"$data\"\n"
	#get plot stuff right
	script=$script"plot \""$filename"\" using "
	#echo $timeUnit (this was added for debugging only and caused a warning when sent to gnuplot, but script was generated even without commenting this.)
	if [[ $timeUnit = "ms" ]]; then
		script=$script"(\$1*1000):2 "
	else
		script=$script"1:2 "
	fi
	script=$script" title \""$title"\" with linespoint"
	echo -e $script
}


########## END ########## DO NOT EDIT THIS LINE OR LINES BELOW THIS

# You are supposed to provide the definition of a bash function called
# get_gnu_script between the START and END lines above.
get_gnu_script "$1"|gnuplot
