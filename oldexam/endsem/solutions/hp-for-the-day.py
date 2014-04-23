#!/usr/bin/python

# Python script to ease the process of assigning house points

# Complete the following code; you can add/modify only between the
# BEGIN and END sections.  First read the background & specifications
# below.

# Background: during each lecture, I note down the names of the
# students who get some house points, say in a text file.

# (1) I may note down any part of a student's name: first name,
# surname, or middle name

# (2) To disambiguate between students who have the same first name or
# same surname, I may note down both: e.g. vaibhav gupta in one entry
# and vaibhav krishan in another.

# (3) Sometimes, a student's name may appear more than once in the
# list.

# (4) The default point won against a name is '1', any non-default is
# specified after the name.

# (5) If a student's name does not appear in the text file, that means
# he/she has no points (0 points) for that day

# The format of the text file is: name, points in each line.  If only
# the name appears, as mentioned earlier, the implicit points won is
# '1'.

# The output has to be such that I can "directly cut-paste it onto a
# spreadsheet".  This simply means that you've to output a column of
# numbers, one each for a student, in the same order in which student
# names appear in the spreadsheet.  We can ignore the header row for
# this exercise.  Also, for the purpose of this exercise, we'll
# hardcode the spreadsheet as "cs305-hp.csv" (same as in quiz2).  Note
# that the python code simply has to output an array of numbers, it
# does not have to modify the spreadsheet itself.

import csv, sys, re, random, os, time

# Bad, bad, bad programming to hard-code names; but we'll do this to
# keep the quiz simple, and reduce my headaches during correction
datfile = "cs305-hp.csv"
if(len(sys.argv) != 2):
    print "Usage: " + sys.argv[0] + " hp-input-file"
infileName = sys.argv[1]

##### Initialize for reading csv file and also for reading HP input file
hpcsv = csv.reader(open(datfile, 'rb'), delimiter=',', quotechar='"')
infile = open(infileName, 'r')

Matrix = []
##### Read csv file and store in list of student names
for row in hpcsv:
    Matrix.append(row)

# BEGIN SECTION_01 DONT_ERASE_THIS_LINE

# Marking: 1 mark for creating 'Names' as per specification below, 1
# mark for a single line solution using appropriate list manipulation

# 'Names' is a list of student names, in the same order as it appears
# in the csv file.  Each entry here is a list of various words in the
# students' name.  For instance, for the student "VAIBHAV GUPTA", the
# list entry would be the list ['VAIBHAV', 'GUPTA'], and for the
# student "BALLA SAI BHUVAN TEJA", the list entry would be the list
# ['BALLA', 'SAI', 'BHUVAN', 'TEJA'].  Thus 'Names' is a list of lists

# Note that in the csv file, the first row is the set of column
# names, and the second column is the student's name
Names = map(lambda L: L[1].split(), Matrix[1:])

#Uncomment these to Check01
#for n in Names:
#    print n
#exit(0)
# END SECTION_01 DONT_ERASE_THIS_LINE

# BEGIN SECTION_02 DONT_ERASE_THIS_LINE

# Marking: 1 mark for a single line appropriate initialization of
# 'thisDayHP' as per the specification below

# List of house points won for the day, in the given input file; this
# list should finally have entries in the same order as the 'Names'
# list; in this section, 'thisDayHP' has to be initialized as a list
# of zeros; the list has to be of appropriate length
thisDayHP = [0]*len(Names)

#Uncomment these to Check02
#for hp in thisDayHP:
#    print hp
#exit(0)

# END SECTION_02 DONT_ERASE_THIS_LINE

# Read the input file as a list of strings
inputLines = map(lambda str1: str1.strip(), infile.readlines())
#Uncomment these to check
#for l in inputLines:
#    print l
#exit(0)

# BEGIN SECTION_03 DONT_ERASE_THIS_LINE

# Marking scheme:
# Should exit with exit value 2 if a given name matches more than one
# entry in the csv file: 0.5 marks
# Should exit with exit value 3 if a given name does not match any
# entry in the csv file: 0.5 marks
# Should print the appropriate output if each name in the input file
# matches exactly one entry in the csv file: 2 marks

# Here is the main logic to compute 'thisDayHP'

for line in inputLines:
    None
    # form a binary array of matches
    namePtsList = line.split(',')
    nameWords = namePtsList[0].split()
    pts = 1
    if(len(namePtsList) > 1):
        pts = int(namePtsList[1])
    def matches(csvNameWords):
        allMatch = True
        for p1 in nameWords:
            thisPartMatch = False
            pattern = "^" + p1 + "$"
            for p2 in csvNameWords:
                if (re.match(pattern, p2, flags=re.I)):
                    thisPartMatch = True
            allMatch = (allMatch and thisPartMatch)
        if(allMatch):
            return 1
        else:
            return 0
    matchList = map(matches, Names)
    numMatches = sum(matchList)
    #print " ".join(nameWords) + ' ' + str(numMatches)
    if(numMatches > 1):
        print "numMatches=" + str(numMatches) + " match for " + " ".join(nameWords)
        print "Can't have numMatches > 1, fix it and rerun"
        exit(2)
    if(numMatches == 0):
        print "numMatches=" + str(numMatches) + " match for " + " ".join(nameWords)
        print "Can't have numMatches = 0, fix it and rerun"
        exit(3)
    ptsList = map(lambda x: x*pts, matchList)
    thisDayHP = zip(thisDayHP, ptsList)
    thisDayHP = map(lambda l: sum(l), thisDayHP)

# END SECTION_03 DONT_ERASE_THIS_LINE

# The final printing of output: to be cut-paste onto the spreadsheet
for p in thisDayHP:
    print p
