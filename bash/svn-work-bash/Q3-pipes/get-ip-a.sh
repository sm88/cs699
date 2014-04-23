#!/bin/bash

# This script should print the IP address of your linux machine's eth0
# interface.  The output should only be an IP address (remove the
# irrelevant parts of the ifconfig command output).

data=$(ifconfig eth0|grep "inet addr")
data=${data#*inet\ addr:}
for i in $data
do
	echo $i
	break
done
