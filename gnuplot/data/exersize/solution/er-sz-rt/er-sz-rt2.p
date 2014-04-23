set term postscript eps

unset logscale
unset xtics
set logscale y
set autoscale x
set size .75,.75

set yrange [.001:1]
set ylabel "Error Rate"
set key top left

set style data histogram
set style histogram cluster
set boxwidth 1
set bmargin 4

set grid
set xtic("1" 1,"2" 2,"5.5" 3, "11" 4, "1" 6, "2" 7, "5.5" 8, "11" 9, "1" 11, "2" 12,"5.5" 13, "11" 14, "1" 15, "2" 16, "5.5" 17, "11" 18, "" 19)
#set xtic(1,2,5.5,11)

set output "er-sz-rt2.eps"

plot    newhistogram "SNR = 13db" lt 1, "er-sz-rt.txt" every ::0::3 using 2  title "100 bytes", '' every ::0::3 using 4  title "500 bytes", '' every ::0::3 using 6  title "1400 bytes", \
        newhistogram "SNR = 8db" lt 1, "er-sz-rt.txt" every ::4::7 using 2  notitle '', '' every ::4::7 using 4  notitle '', '' every ::4::7 using 6  notitle, \
        newhistogram "SNR = 3db" lt 1, "er-sz-rt.txt" every ::8::11 using 2  notitle, '' every ::8::11 using 4  notitle, '' every ::8::11 using 6  notitle, \
        newhistogram "SNR = 2b" lt 1, "er-sz-rt.txt" every ::12::15 using 2   notitle, '' every ::12::15 using 4  notitle, '' every ::12::15 using 6  notitle
                
