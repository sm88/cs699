#set term postscript eps
set xrange [.01:60]
set yrange [.001:1]
set xlabel "Averaging Interval (sec)"
set ylabel "Allan Deviation"
set logscale x
set logscale y
set grid

set style line 1 lt 1 lc rgb "#000000" lw 5 pt 9
set style line 2 lt 2 lc rgb "#000000" lw 5 pt 5
#set output "allan-dev-sm.eps"

plot 	"allan-dev.txt" using 1:2:xtic(1) title "Measured" with linespoint ls 1, \
	"allan-dev.txt" using 1:4 title "Uniform" with linespoint ls 2 
