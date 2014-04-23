set term postscript eps color

set key graph 0.9,0.4
#set size 0.8, 0.8

set xlabel "Number of Nodes"
set ylabel "Utilization (%)"
set grid
#set yrange [0:100]
 

set output 'test-mlb.eps'

plot \
'../sim-data-files/non-uniform-err/nodes10/no_flow_control/Err_MLB_10_1-sum.txt' using 4 t'nf-10-1' with linespoint lt 1 lw 3 pt 3, \
'../sim-data-files/non-uniform-err/nodes10/no_flow_control/Err_MLB_10_5-sum.txt' using 4 t'nf-10-5' with linespoint lt 1 lw 3 pt 5, \
'../sim-data-files/non-uniform-err/nodes10/no_flow_control/Err_MLB_20_1-sum.txt' using 4 t'nf-20-1' with linespoint lt 1 lw 3 pt 7, \
'../sim-data-files/non-uniform-err/nodes10/no_flow_control/Err_MLB_20_5-sum.txt' using 4 t'nf-20-5' with linespoint lt 1 lw 3 pt 2, \
'../sim-data-files/non-uniform-err/nodes10/no_flow_control/Err_MLB_20_10-sum.txt' using 4 t'nf-20-10' with linespoint lt 1 lw 3 pt 1, \
'../sim-data-files/non-uniform-err/nodes10/flow_control/Err_MLB_10_1-sum.txt' using 4 t'10-1' with linespoint lt 3 lw 3 pt 3, \
'../sim-data-files/non-uniform-err/nodes10/flow_control/Err_MLB_10_5-sum.txt' using 4 t'10-5' with linespoint lt 3 lw 3 pt 5, \
'../sim-data-files/non-uniform-err/nodes10/flow_control/Err_MLB_20_1-sum.txt' using 4 t'20-1' with linespoint lt 3 lw 3 pt 7, \
'../sim-data-files/non-uniform-err/nodes10/flow_control/Err_MLB_20_5-sum.txt' using 4 t'20-5' with linespoint lt 3 lw 3 pt 2, \
'../sim-data-files/non-uniform-err/nodes10/flow_control/Err_MLB_20_10-sum.txt' using 4 t'20-10' with linespoint lt 3 lw 3 pt 1

