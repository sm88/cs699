set term postscript eps color

set key graph 0.9,0.4
#set size 0.8, 0.8

set xlabel "Number of Nodes"
set ylabel "Utilization (%)"
set grid
#set yrange [0:100]
 

set output 'test-rnd.eps'

plot \
'../sim-data-files/non-uniform-err/rnd-err/no_flow_control/Err_RND_1-sum.txt' using 3 t'nf1' with linespoint lt 1 lw 3 pt 3, \
'../sim-data-files/non-uniform-err/rnd-err/no_flow_control/Err_RND_2-sum.txt' using 3 t'nf2' with linespoint lt 1 lw 3 pt 5, \
'../sim-data-files/non-uniform-err/rnd-err/no_flow_control/Err_RND_3-sum.txt' using 3 t'nf3' with linespoint lt 1 lw 3 pt 7, \
'../sim-data-files/non-uniform-err/rnd-err/no_flow_control/Err_RND_4-sum.txt' using 3 t'nf4' with linespoint lt 1 lw 3 pt 2, \
'../sim-data-files/non-uniform-err/rnd-err/no_flow_control/Err_RND_5-sum.txt' using 3 t'nf5' with linespoint lt 1 lw 3 pt 1, \
'../sim-data-files/non-uniform-err/rnd-err/flow_control/Err_RND_1-sum.txt' using 3 t'f1' with linespoint lt 3 lw 3 pt 3, \
'../sim-data-files/non-uniform-err/rnd-err/flow_control/Err_RND_2-sum.txt' using 3 t'f2' with linespoint lt 3 lw 3 pt 5, \
'../sim-data-files/non-uniform-err/rnd-err/flow_control/Err_RND_3-sum.txt' using 3 t'f3' with linespoint lt 3 lw 3 pt 7, \
'../sim-data-files/non-uniform-err/rnd-err/flow_control/Err_RND_4-sum.txt' using 3 t'f4' with linespoint lt 3 lw 3 pt 2, \
'../sim-data-files/non-uniform-err/rnd-err/flow_control/Err_RND_5-sum.txt' using 3 t'f5' with linespoint lt 3 lw 3 pt 1

