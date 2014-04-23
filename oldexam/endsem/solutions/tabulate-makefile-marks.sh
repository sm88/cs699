#!/bin/bash
for roll in *
do
	head -1 $roll/makefile-correction.txt | sed "s/Makefile marks=/$roll,/"
done
