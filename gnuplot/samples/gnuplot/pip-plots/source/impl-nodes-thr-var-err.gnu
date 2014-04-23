set term postscript eps color

set key graph 0.95,0.3
set size 0.8, 0.8

set xlabel "Number of Nodes"
set ylabel "Throughput Efficiency (%)"
set y2label "Throughput (kbps)"
set grid
set yrange [50:100]
set y2range [31:63]
set y2tics 6
set y2tics border
set grid y2tics
 

set output 'impl-nodes-thr-var-err.eps'

plot \
'data/impl-nodes10-err0-qsize10-run2.txt' using 1:($2*100/$3) t'Err 00%' with linespoint lt 1 lw 3 pt 3,\
'data/impl-nodes10-err1-qsize10-run2.txt' using 1:($2*100/$3)t'Err 01%' with linespoint lt 3 lw 3 pt 1,\
'data/impl-nodes10-err5-qsize10-run2.txt' using 1:($2*100/$3)t'Err 05%' with linespoint lt 6 lw 3 pt 7,\
'data/impl-nodes10-err10-qsize10-run2.txt' using 1:($2*100/$3)t'Err 10%' with linespoint lt 4 lw 3 pt 9,\
'data/impl-nodes10-err20-qsize10-run2.txt' using 1:($2*100/$3)t'Err 20%' with linespoint lt 9 lw 3 pt 5
