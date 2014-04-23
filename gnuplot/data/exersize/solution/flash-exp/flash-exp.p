set term postscript eps

set grid
set xrange [0:512]
set yrange [0:1200]

set xlabel "Number of Bytes"
set ylabel "Latency (ticks)"
set key at 460,780

set style line 1 lt 1 lc rgb "#FF0000" lw 4 pt 1
set style line 2 lt 3 lc rgb "#0000FF" lw 4 pt 7
set style line 3 lt 5 lc rgb "#00FF00" lw 4 pt 5

set output "flash-exp-sm.eps"

plot	"flash-exp.txt" using 1:2 with linespoint ls 1 title "read", \
	"flash-exp.txt" using 1:3 with linespoint ls 2 title "write", \
	"flash-exp.txt" using 1:4 with linespoint ls 3 title "sync"
