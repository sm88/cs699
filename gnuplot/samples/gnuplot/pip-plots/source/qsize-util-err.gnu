set term postscript eps color

set key graph 0.95,0.45
set size 0.8, 0.8

set ylabel "Queue Overflow (%)"
set xlabel "Queue Size"
set y2label "Utilization (%)"
set xrange [0:20]	
set yrange [0:20]
set y2range [60:100]
set y2tics border
set grid
set mytics 2 
set mxtics 2 
set grid mytics mxtics

set output 'qsize-util-err.eps'
plot \
'data/anal-loss01-node1-stats.txt' using 1:($3*100) t'QO: Err 01%' with linespoint lt 3 lw 3 pt 5,\
'data/anal-loss05-node1-stats.txt' using 1:($3*100) t'QO: Err 05%' with linespoint lt 3 lw 3 pt 9,\
'data/anal-loss10-node1-stats.txt' using 1:($3*100) t'QO: Err 10%' with linespoint lt 3 lw 3 pt 7,\
'data/anal-loss20-node1-stats.txt' using 1:($3*100) t'QO: Err 20%' with linespoint lt 3 lw 3 pt 3,\
'data/anal-loss01-node1-stats.txt' using 1:($2*100) axes x1y2 t'Util: Err 01%' with linespoint lt 1 lw 3 pt 4,\
'data/anal-loss05-node1-stats.txt' using 1:($2*100) axes x1y2 t'Util: Err 05%' with linespoint lt 1 lw 3 pt 8,\
'data/anal-loss10-node1-stats.txt' using 1:($2*100) axes x1y2 t'Util: Err 10%' with linespoint lt 1 lw 3 pt 6,\
'data/anal-loss20-node1-stats.txt' using 1:($2*100) axes x1y2 t'Util: Err 20%' with linespoint lt 1 lw 3 pt 2

