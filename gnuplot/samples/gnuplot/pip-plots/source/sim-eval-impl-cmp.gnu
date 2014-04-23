set term postscript eps color

set key graph 0.95,0.5
set size 0.8, 0.8

set xlabel "Number of Nodes"
set ylabel "Throughput Efficiency (%)"
set y2label "Throughput (kbps)"
set grid
set yrange [50:100]
set y2range [31:63]
set y2tics 6
set y2tics border 
set grid y2tics

set output 'sim-eval-impl-cmp.eps'

plot \
'data/anal-loss10-nodes10-qsize10.txt' using 1:(($1)*100/($1)) t'Anal: Err 0%' with linespoint lt 1 lw 3 pt 1,\
'data/anal-loss10-nodes10-qsize10.txt' using 1:($2*100) t'Anal: Err 10%' with linespoint lt 1 lw 3 pt 2,\
'data/anal-loss2010-nodes10-qsize10.txt' using 1:($2*100) t'Anal: Err Var' with linespoint lt 1 lw 3 pt 3,\
'data/sim-Err0_qsize10.0_pkt1000-summary.txt' using 1:($4*200) t'Sim: Err 00%' with linespoint lt 3 lw 3 pt 4,\
'data/sim-Err10_qsize10.0_pkt1000-summary.txt' using 1:($4*200) t'Sim: Err 10%' with linespoint lt 3 lw 3 pt 6,\
'data/sim-Err_LLB_20_5_qsize10.0_pkt10000-summary.txt' using 1:($4*200) t'Sim: Err Var' with linespoint lt 3 lw 3 pt 8,\
'data/impl-nodes10-err0-qsize10-run2.txt' using 1:($2*100/$3) t'Impl: Err 00%' with linespoint lt 4 lw 3 pt 5,\
'data/impl-nodes10-err10-qsize10-run2.txt' using 1:($2*100/$3)t'Impl: Err 10%' with linespoint lt 4 lw 3 pt 7,\
'data/impl-nodes-4-6-8-10-varerr.txt' using 1:($2*100/$3)t'Impl: Err Var' with linespoint lt 4 lw 3 pt 9
