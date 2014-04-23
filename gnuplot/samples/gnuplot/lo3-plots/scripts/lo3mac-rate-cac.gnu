set terminal postscript color eps enhanced solid
set output "../graphs/rateScheduleCAC.eps"
set title "Call Admission Control"
#set key autotitle columnheader
set auto x
set style data histogram
set style histogram cluster gap 1
#set style histogram rowstacked
set style fill solid border -1
set xtic rotate by -45
set boxwidth 0.75
set ylabel "No of calls"

plot newhistogram "Generation Rate", '../plot-data/rateScheduleCAC.data' using 1:xtic(1),\
'' using 2 title 'Flow Requests Received', \
'' using 3 title 'Admitted', \
'' using 4 title 'Timedout (Rejected)', \
'' using 5 title 'Erroneously Dropped'
