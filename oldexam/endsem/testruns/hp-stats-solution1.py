#!/usr/bin/python

#--- You should FILL code ONLY between BEGIN and END lines given
#--- below.  The rest of this code template should be INTACT.  You MAY
#--- LOSE ANY/MANY/MOST/ALL MARKS if you change any portion of the
#--- code other than where indicated.

##### BEGIN: Fill your details as comments here DONT_ERASE_01
# Name:
# Roll number:
# House name:
##### END: Fill your details as comments here DONT_ERASE_01

# Input data format assumptions: csv file with comma separator and
# double-quote as text quote character
# First row is assumed to be column names
# First column is called RollNum which represents the roll number
# Second column is called Name which represents the student's name
# Third column is called House which represents the student's house name
# The remaining columns have a name like 18-Oct, which corresponds to
# the house points assigned on 18-Oct to each student
# The dates appear in reverse chronological order, i.e. most recent
# date first
# House point entries can be positive or negative or zero; if there is
# no entry in a cell, it implies a zero

import csv, sys, re, random, os, time

# Bad, bad, bad programming to hard-code names; but we'll do this to
# keep the quiz simple, and reduce my headaches during correction
datfile = "cs305-hp.csv"
outfileName = "hp-stats.dat"

##### BEGIN: Init DONT_ERASE_02
##### Initialize for reading csv file and also for writing output file
hpcsv = csv.reader(open(datfile, 'rb'), delimiter=',', quotechar='"')
outfile = open(outfileName, 'w')
##### END: Init DONT_ERASE_02

# Bad, bad, bad programming again, to hard-code something from the
# data file; but we'll do it to keep the quiz simple
houseNames = ['dollar32', 'lwaajkal', 'singham', 'sorryshaktimaan']

# This would be the first row
colnames = []

# Matrix of all the rows, excluding the header row (first row)
HPMatrix = []

rowNum = 0
##### BEGIN: Read DONT_ERASE_03
##### Read csv file and store in HPMatrix, also store colnames
for row in hpcsv:
    rowNum += 1
    if (rowNum == 1):
        colnames = row
        continue

    HPMatrix.append(row)
##### END: Read DONT_ERASE_03

# Transpose of HPMatrix; use as necessary
HPMatrixTranspose = zip(*HPMatrix)

# houseMatrix[housename] will be the sub matrix of HPMatrix,
# corresponding to the given house name
houseMatrix = {}
# houseWiseStudentCount[housename] will be an integer, the number of
# students in the given house name
houseWiseStudentCount = {}

##### BEGIN: houseMatrix houseWiseStudentCount DONT_ERASE_04

## Split HPMatrix into 4 sub-matrices: one per house, then use it
## to get a house-wise student count [1 mark, 2 HP]
## 2 HP for determining each houseMatrix[hname] in a single line,
## based on filter

dummy1=None
dummy2=None
# The following None statement has a few spaces and tabs following it
None 	 	
for hname in houseNames:
    None
    houseMatrix[hname] = filter(lambda row: re.match("^"+hname+"$", row[2]), HPMatrix)
    houseWiseStudentCount[hname] = len(houseMatrix[hname])

None

print houseWiseStudentCount # Uncomment to test 04
#exit(0) # Uncomment to test 04 only until this part of the code

##### END: houseMatrix houseWiseStudentCount DONT_ERASE_04

# houseWiseHP[housename] will be an integer, the total house points
# count for the given house name
houseWiseHP = {}

##### BEGIN: houseWiseHP DONT_ERASE_05

## House-wise HP count [1 + 1 = 2 marks, 3 HP]
## 1 mark for correct solution; 1 more mark + 3 HP for single-line solution

None
None

print None
# dummy comment
dummy1=None
for hname in houseNames:
    houseWiseHP[hname] = sum(map(lambda row: sum(map(lambda x: (len(x) > 0) and int(x) or 0, row[3:])), houseMatrix[hname]))

#print houseWiseHP # Uncomment to test 05
#exit(0) # Uncomment to test 05 only until this part of the code

##### END: House-wise HP count DONT_ERASE_05

# A student is said to have participated, if he/she won a positive
# house point on a particular day; houseWiseParticipation[housename]
# will be an integer, the total participation count for the given
# house name
houseWiseParticipation = {}

##### BEGIN: houseWiseParticipation DONT_ERASE_06

## House-wise participation count [0.5 + 0.5 = 1 mark, 1HP]
## 0.5 marks for correct solution; 0.5 more marks + 1 HP for
## single-line solution

# Code to determine houseWiseParticipation below
for hname in houseNames:
    houseWiseParticipation[hname] = sum(map(lambda row: sum(map(lambda x: ((len(x) > 0) and (int(x) > 0)) and 1 or 0, row[3:])), houseMatrix[hname]))

#print houseWiseParticipation # Uncomment to test 06
#exit(0) # Uncomment to test 06 only until this part of the code

##### END: houseWiseParticipation DONT_ERASE_06

# houseWiseNegatives[housename] will be an integer, the total house
# points count for the given house name, counting only the negative
# scores
houseWiseNegatives = {}

##### BEGIN: houseWiseNegatives DONT_ERASE_07

## House-wise negative point count [0.5 marks]

for hname in houseNames:
    houseWiseNegatives[hname] = sum(map(lambda row: sum(map(lambda x: ((len(x) > 0) and (int(x) < 0)) and int(x) or 0, row[3:])), houseMatrix[hname]))

#print houseWiseNegatives # Uncomment to test 07
#exit(0) # Uncomment to test 07 only until this part of the code

##### END: houseWiseNegatives DONT_ERASE_07

# houseWiseNumNegatives[housename] will be an integer, the total
# number of instances where a student from the house got a negative
# point
houseWiseNumNegatives = {}

##### BEGIN: houseWiseNumNegatives DONT_ERASE_08

## House-wise negative instance count [0.5 marks]

for hname in houseNames:
    houseWiseNumNegatives[hname] = sum(map(lambda row: sum(map(lambda x: ((len(x) > 0) and (int(x) < 0)) and 1 or 0, row[3:])), houseMatrix[hname]))

#print houseWiseNumNegatives # Uncomment to test 08
#exit(0) # Uncomment to test 08 only until this part of the code

##### END: houseWiseNumNegatives DONT_ERASE_08

# houseWiseTotalPerDay[housename] is a list, with one element per day;
# each such element is the number of house points won by students from
# the given house on that day
houseWiseTotalPerDay = {}

##### BEGIN: houseWiseTotalPerDay DONT_ERASE_09

## House-wise total per day [2 marks, 3 bonus marks, 10 HP]
## 2 marks for correct solution; 3 bonus marks + 10 HP for a
## single-line solution (no bonus marks for submissions after 5pm)

for hname in houseNames:
    houseWiseTotalPerDay[hname] = map(lambda L: sum(map(lambda x: (len(x)>0) and int(x) or 0, L)), zip(*(houseMatrix[hname]))[3:])

#print houseWiseTotalPerDay # Uncomment to test 09
#exit(0) # Uncomment to test 09 only until this part of the code

##### END: houseWiseTotalPerDay DONT_ERASE_09

# houseWiseCumTotalPerDay[housename] is a list, with one element per
# day; each such element is the cumulative number of house points won
# by students from the given house until and including that day
houseWiseCumTotalPerDay = {}

##### BEGIN: houseWiseCumTotalPerDay DONT_ERASE_10

## House-wise cumulative total per day [1 + 1 = 2 marks]
## 1 mark for correct solution; 1 mark for solution based on map (not
## necessarily single-line)

gsum = 0
def cumsum(x):
    global gsum
    gsum += x
    return gsum
for hname in houseNames:
    houseWiseTotalPerDay[hname].reverse()
    gsum = 0
    houseWiseCumTotalPerDay[hname] = map(cumsum, houseWiseTotalPerDay[hname])

#print houseWiseCumTotalPerDay # Uncomment to test 10
#exit(0) # Uncomment to test 10 only until this part of the code

##### END: houseWiseCumTotalPerDay DONT_ERASE_10

## DO NOT WRITE ANYTHING BELOW

## Write output file for plotting
dates = colnames[3:]
dates.reverse()
for i in range(len(dates)):
    outfile.write(dates[i])
    for hname in houseNames:
        outfile.write("\t" + str(houseWiseCumTotalPerDay[hname][i]))
    outfile.write("\n")
outfile.close()
## Write output file for plotting done
