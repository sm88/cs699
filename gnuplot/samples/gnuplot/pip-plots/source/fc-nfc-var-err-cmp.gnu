set term postscript eps color

set key graph 0.9,0.4
set size 0.8, 0.8

set xlabel "Queue Size"
set ylabel "Throughput Efficiency (%)"
set y2label "Throughput (kbps)"
set grid
set yrange [50:100]
#set xrange [2:10]
set y2range [31:63]
set y2tics 6
set y2tics border
set grid y2tics
set output 'fc-nfc-var-err-cmp.eps'

plot \
'data/sim-nfc-Err_LLB_20_1-sum.txt' using 1:($4*200) t'NFC-LLB:<01,20>' with linespoint lt 1 lw 3 pt 5, \
'data/sim-nfc-Err_LLB_20_10-sum.txt' using 1:($4*200) t'NFC-LLB:<10,20>' with linespoint lt 1 lw 3 pt 7, \
'data/sim-nfc-Err_RND_1-sum.txt' using 1:($4*200) t'NFC-RND:<VAR-1>' with linespoint lt 1 lw 3 pt 9,\
'data/sim-nfc-Err_RND_2-sum.txt' using 1:($4*200) t'NFC-RND:<VAR-2>' with linespoint lt 1 lw 3 pt 3,\
'data/sim-fc-Err_LLB_20_1-sum.txt' using 1:($4*200) t'FC-LLB:<01,20>' with linespoint lt 3 lw 3 pt 4, \
'data/sim-fc-Err_LLB_20_10-sum.txt' using 1:($4*200) t'FC-LLB:<10,20>' with linespoint lt 3 lw 3 pt 6,\
'data/sim-fc-Err_RND_1-sum.txt' using 1:($4*200) t'FC-RND:<VAR-1>' with linespoint lt 3 lw 3 pt 8,\
'data/sim-fc-Err_RND_2-sum.txt' using 1:($4*200) t'FC-RND:<VAR-2>' with linespoint lt 3 lw 3 pt 2

