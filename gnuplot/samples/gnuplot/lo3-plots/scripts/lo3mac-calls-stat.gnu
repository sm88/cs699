jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps color
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium color

set size 0.75, 0.35

set xrange [-0.5:12.5]
#set logscale y


#set yrange [4:*]

set ytic 10
set xtic 1

set xlabel "Number of calls in progress"

set grid

set notitle
set nokey
set boxwidth 0.5

set ylabel "Percentage of \n call requests"
set output '../graphs/callsperrequest.eps'
plot '../plot-data/simcalls.data' using ($1):($3*100)  with boxes


set ylabel "Fraction of \n rejected requests"
set output '../graphs/rejectionspercalls.eps'
plot '../plot-data/simcalls.data' using ($1):($6*100)  t 'Rejected calls' with boxes


set ytic 0.2
set ylabel "Probability \n of rejection"
set output '../graphs/rejectionsprobability.eps'
plot '../plot-data/simcalls.data' using ($1):($5)  t 'Rejected'  with boxes

#plot '../plot-data/simCalls.txt' using ($3/60000):1 t '#ongoing' with points pt 1 


#set ytic 1
#set yrange [0:5]
#set output '../graphs/droppedcalls.eps'
#plot '../plot-data/simCallsR1D2E0S12.data' using ($3/60000):2 t '#dropped' with points pt 2 
#

#plot '../plot-data/simCalls.txt' using ($3/60000):2 t '#dropped' with points pt 2


#     '../plot-data/simCallsR0.75D2E0S4.data' using 2:1 t'cr=0.75' with points, \
#     '../plot-data/simCallsR0.5D2E0S4.data' using 2:1 t'cr=0.5' with points

#     '../plot-data/simCallsR2D2E0S4.data' using 2:1 t'cr=2' with points, \
     #'../plot-data/flowreqlatencyR0.5D2E0S4.cdf.data' using 1:2 t'R0.5' with linespoint lt 1 lw 3 pt 9,\
     


