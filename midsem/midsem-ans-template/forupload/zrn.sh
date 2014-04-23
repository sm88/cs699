#!/bin/bash

# This is a self-extracting bash script
# When run, it generates the file zrn-temp.jpg in the current directory
# Subsequently it invokes eog on zrn-temp.jpg to display the file

# The script cannot depend on the presence of any file other than
# itself (i.e. it must be capable of running 'stand-alone').  But it
# can generate temporary files as needed, in the current directory.

# Marks: 2
# HP: 2
# 2 HP for getting this question right
# Hint: lookup the use of encoding of binary files, using base64, to
# ASCII files.  The relevant commands are uudecode and uuencode.

########## START ########## DO NOT EDIT THIS LINE OR LINES ABOVE THIS
cat ../zrn-orig.jpg|uuencode zrn-temp5.jpg|uudecode -o zrn-temp.jpg
########## END ########## DO NOT EDIT THIS LINE OR LINES BELOW THIS

# Code to display the generated zrn-temp.jpg is provided below
eog zrn-temp.jpg
