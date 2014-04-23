set term postscript eps color

set key graph 0.85,0.95
set size 0.8, 0.8

set xlabel "Frame No"
set ylabel "Queue Size"
set grid
set xrange [0:650] 

set output 'qsize-var.eps'

plot \
'data/node9.qsize' using ($2-5):4 t'Node 2' with linespoint lt 1 lw 3 pt 5,\
'data/node2.qsize' using ($2-5):4 t'Node 9' with linespoint lt 3 lw 3 pt 7
