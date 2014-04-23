set term postscript eps

set output "er-sz-rt-sm.eps"

set xtic(       "1" 1, "2" 2, "5.5" 3, "11" 4, \
                "1" 6, "2" 7, "5.5" 8, "11" 9, \
                "1" 11, "2" 12, "5.5" 13, "11" 14, \
                "1" 16, "2" 17, "5.5" 18, "11" 19 \
        )
set key left top
set ylabel "Error Rate"
set xlabel "SNR = 13db\t\tSNR = 8db\t\tSNR = 3db\t\tSNR = 2db"
set size .75,.75

set yrange [.001:1]
set logscale y
set style data boxes
set boxwidth 0.12
set bmargin 4
set grid

fileName = "er-sz-rt.txt"
t1=-0.17
t2=0
t3=0.15

plot    fileName using (t1=(((t1+1==4.83) || (t1+1==9.83) || (t1+1==14.83))?t1+2:t1+1)):2 with boxes fs solid 1 border -1 lt 1 lc rgb "#999999" title "100 bytes", \
        fileName using (t2=(((t2+1==5) || (t2+1==10) ||(t2+1==15))?t2+2:t2+1)):4 with boxes fs pattern 1 title "500 bytes", \
        fileName using (t3=(((t3+1==5.15) || (t3+1==10.15) || (t3+1==15.15))?t3+2:t3+1)):6 with boxes fs pattern 3 title "1400 bytes"
