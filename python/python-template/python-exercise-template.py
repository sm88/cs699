#! /usr/bin/python

import sys
import csv
import re

ans=1
d={}
def separate():
    global ans
    print "\n************Answer %d **************\n" % ans
    ans=ans+1
######################  1  #####################################
separate()
if len(sys.argv)>2 or len(sys.argv)==1:
    print "Usage: "+sys.argv[0]+" <csv-file>"
    sys.exit(1)

with open(sys.argv[1],'rb') as csvFile:
    marksReader = csv.reader(csvFile,quotechar='"')  #delimiter default to ,
    count=0
    for row in marksReader:
        if re.match('^[0-9]+$',row[0]) is not None:
            count=count+1
    print "Number of students (1): %d" % count

########################  2  ####################################
    separate()
    rows=[]
    csvFile.seek(0,0)   #we've read the file once, need to reinitialize
    for row in marksReader:
        if re.match('^[0-9]+$',row[0]) is not None:
            rows.append(row)
    print "Number of students (2): %d " % len(rows)

########################  3  ####################################
    separate()
    selections = map ((lambda x : int(x[-1])), rows)
    print "Number of selections (3): %d " % sum(selections)

########################  4  ####################################
    separate()
    selectedRows = filter ((lambda x : int(x[-1]) == 1), rows)
    print "Number of selections (4): %d " % len(selectedRows)

########################  5  ####################################
    separate() 
    index = {}
    csvFile.seek(0,0)
    for row in marksReader:
        if 'Sno' == row[0]:            
            index = {x:y for (x,y) in zip(row,range(0,len(row)))}
            break

    print "Index is (5): "
    for key in index.keys():
        print repr(key) + ":" + repr(index[key])

########################  6  ####################################
    separate()    
    def toFloat(x):    
        t=0
        try:
            t=float(x)
        except:
            t=0.0
        return t

    for row in rows:
        row.append(sum(map(lambda x:toFloat(x),row[1:6])))

    rows.sort(key=(lambda x:x[-1]))

    with open('marks-out.csv','wb') as csvOut:
        csvWriter = csv.writer(csvOut)
        for row in rows:
            csvWriter.writerow(row)

    print "File written (6)"

########################  7  ###################################
    separate()
    top20pM = rows[int(0.8*len(rows)):len(rows)]
    bot40pM = rows[0:(int(0.4*len(rows))+1)]

    print "Top 20"
    print "\n".join(map(lambda x:str(x),top20pM)), "\n\n"
    print "Bottom 40"
    print "\n".join(map(lambda x:str(x),bot40pM))

########################  8  ###################################
    separate()
    keyword = ["Sno", "Sel", "NA"]
    print "\toverall\ttop10\tbottom40"
    for key in index.keys():
        if key not in keyword:
            print key,"\t",\
            len(filter(lambda x:x[index[key]] != keyword[2], rows)),"\t" \
            ,len(filter(lambda x:x[index[key]] != keyword[2], rows[int(0.9*len(rows)):len(rows)])),"\t" \
            ,len(filter(lambda x:x[index[key]] != keyword[2], bot40pM)) \
            ,"\n"

#########################  9  #####################################
    separate()
    def average(ls):
        return sum(ls)*1.0/len(ls)

    def variance(ls):
        avg = average(ls)
        return sum([(x - avg)**2 for x in ls])/len(ls)

    def stdDev(ls):
        return variance(ls)**(0.5)

    def cov(ls1,ls2):
        ##E[xy]-E[x]E[y]
        temp=[x*y for x,y in zip(ls1,ls2)]
        return average(temp) - (average(ls1) * average(ls2))

    def correlation(ls1,ls2):
        return cov(ls1,ls2)/(stdDev(ls1) * stdDev(ls2))

    marks=[x[-1] for x in rows]
    sel=[int(x[index[keyword[1]]]) for x in rows]

    print "Correlation is: %1.3f" % correlation(marks,sel)
