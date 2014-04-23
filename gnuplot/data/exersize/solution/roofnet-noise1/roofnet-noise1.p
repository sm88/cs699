set term postscript eps

set size .8,.4

set xrange [0:70]
set yrange [-100:-70]

set xlabel "Transmitter-Receiver pair num."
set ylabel "Silence level (dBm)
set key at 56,-71.5

set style line 1 lt 1 lw 3 lc rgb "#FF0000" pt 1
set style line 2 lt 3 lw 3 lc rgb "#0000FF" pt 9
set style line 3 lt 7 lw 3 lc rgb "#000000" pt 2

set output "roofnet-noise1-sm.eps"

plot	"roofnet-noise1.txt" u :1 ls 1 w linespoint title "5%-ile", \
	"roofnet-noise1.txt" u :4 ls 2 w linespoint title "Median (50%-ile)", \
	"roofnet-noise1.txt" u :2 ls 3 w linespoint title "95%-ile"
