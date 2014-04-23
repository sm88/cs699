set term postscript eps

set xrange [1:6]
set yrange [0:450]

set xlabel "Number of Hops"
set ylabel "Latency (seconds)"

set key at 5.56,295
set grid

set style line 1 lt 4 lw 3 lc rgb "#FF00FF" pt 9
set style line 2 lt 7 lw 3 lc rgb "#000000" pt 7
set style line 3 lt 3 lw 3 lc rgb "#0000FF" pt 1
set style line 4 lt 1 lw 3 lc rgb "#FF0000" pt 2

set output "pip-latency-comparison-sm.eps"

plot 	"pip-latency-comparison.txt" u 1:2 ls 4 with linespoint title "PIP", \
	"pip-latency-comparison.txt" u 1:3 ls 3 with linespoint title "Flush", \
	"pip-latency-comparison.txt" u 1:4 ls 2 with linespoint title "PSFQ", \
	"pip-latency-comparison.txt" u 1:5 ls 1 with linespoint title "Fetch"



