set term postscript eps

set xrange [1:10]
set yrange [-20:120]
set xlabel "Supplier number"
set ylabel "Average weight of potato sack (kg)"

set grid

set output "errorbars-sm.eps"

set style line 1 lt 1 lw 3 lc rgb "#FF0000" pt 9
set style line 2 lt 2 lw 3 lc rgb "#0000FF" pt 2

plot 	"errorbars.txt" using 1:2 with linespoint ls 1 title "Average over 10 sacks", \
	"errorbars.txt" using 1:2:3 with errorbars ls 2 notitle
