#!/usr/bin/python

import sys

if (len(sys.argv) != 2):
    print "Usage: " + sys.argv[0] + " positiveInteger"
    exit(1)
N = int(sys.argv[1])
nums = range(2, N+1)
for x in range(2,N/2+1):
    nums = filter(lambda num: (x == num) or ((num%x) != 0), nums)

print nums
