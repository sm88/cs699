set term postscript eps

set xlabel "WiFi inter-packet gap (milli-seconds)"
set ylabel "Throughput (Kbps)"

set yrange [0:66]
set size .75,.75
set key at 4.61,59.5

set style data boxes
set style fill solid 1.0 border -1
set style line 1 lt 3 lc rgb "#0000FF" lw 3 pt 2
set boxwidth 0.17
set bmargin 4
set grid

fileName="pip-channel-hop.txt"

set xtic("Cafe" 1,"Library" 2,"0.040" 3, "4" 4,"12" 5,"24" 6,"48" 7,"100" 8,"248" 9);
set mxtics(1);
set mytics(5);
set grid mxtics
set grid mytics

set output "pip-channel-hop-sm.eps"
t1=-1.08
t2=-0.92
plot    fileName using (t1=t1+1):2 with boxes lt 1 lc rgb "#FF0000" title "Without-Hopping", \
        fileName using (t2=t2+1):3 with boxes lt 1 lc rgb "#00FF00" title "With-Hopping", \
        fileName using :4 ls 1 with linespoint title "Without Interference"
