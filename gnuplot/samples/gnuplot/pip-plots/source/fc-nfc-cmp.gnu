set term postscript eps color

set key graph 0.9,0.4
set size 0.8, 0.8

set xlabel "Queue Size"
set ylabel "Throughput Efficiency (%)"
set y2label "Throughput (kbps)"
set grid
set yrange [50:100]

set y2range [31:63] 
set y2tics 6
set y2tics border
set grid y2tics 
set output 'fc-nfc-cmp.eps'

plot \
'data/sim-nf-err1-node10-qstats.txt' using 1:($4*200) t'NFC:01%' with linespoint lt 1 lw 3 pt 5,\
'data/sim-nf-err5-node10-qstats.txt' using 1:($4*200) t'NFC:05%' with linespoint lt 1 lw 3 pt 7,\
'data/sim-nf-err10-node10-qstats.txt' using 1:($4*200) t'NFC:10%' with linespoint lt 1 lw 3 pt 9, \
'data/sim-nf-err20-node10-qstats.txt' using 1:($4*200) t'NFC:20%' with linespoint lt 1 lw 3 pt 3,\
'data/sim-fc-err1-node10-qstats.txt' using 1:($4*200) t'FC:01%' with linespoint lt 3 lw 3 pt 4,\
'data/sim-fc-err5-node10-qstats.txt' using 1:($4*200) t'FC:05%' with linespoint lt 3 lw 3 pt 6,\
'data/sim-fc-err10-node10-qstats.txt' using 1:($4*200) t'FC:10%' with linespoint lt 3 lw 3 pt 8, \
'data/sim-fc-err20-node10-qstats.txt' using 1:($4*200) t'FC:20%' with linespoint lt 3 lw 3 pt 2
