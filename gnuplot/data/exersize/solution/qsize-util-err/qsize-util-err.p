set term postscript eps

set size .8,.8
set xrange [0:20]
set yrange [0:20]
set y2range [60:100]
set y2tics 5
set mxtics 2.5
set key at 19,9

set style line 1 lt 1 lw 3 lc rgb "#FF0000"
set style line 2 lt 3 lw 3 lc rgb "#0000FF"

set xlabel "Queue Size"
set ylabel "Queue Overflow (%)"
set y2label "Utilization"
set grid
set grid y2tics
set grid mxtics

set output "qsize-util-err-sm.eps"
plot    "qsize-util-err/anal-loss01-node1-stats.txt" u 1:($3*100) ls 2 pt 5 w linespoint title "QO: Err 01%", \
        "qsize-util-err/anal-loss05-node1-stats.txt" u 1:($3*100) ls 2 pt 9 w linespoint title "QO: Err 05%", \
        "qsize-util-err/anal-loss10-node1-stats.txt" u 1:($3*100) ls 2 pt 7 w linespoint title "QO: Err 10%", \
        "qsize-util-err/anal-loss20-node1-stats.txt" u 1:($3*100) ls 2 pt 3 w linespoint title "QO: Err 20%", \
        "qsize-util-err/anal-loss01-node1-stats.txt" u 1:($2*100) axes x1y2 ls 1 pt 4 w linespoint title "Util: Err 01%", \
        "qsize-util-err/anal-loss05-node1-stats.txt" u 1:($2*100) axes x1y2 ls 1 pt 8 w linespoint title "Util: Err 05%", \
        "qsize-util-err/anal-loss10-node1-stats.txt" u 1:($2*100) axes x1y2 ls 1 pt 6 w linespoint title "Util: Err 10%", \
        "qsize-util-err/anal-loss20-node1-stats.txt" u 1:($2*100) axes x1y2 ls 1 pt 2 w linespoint title "Util: Err 20%"
        
