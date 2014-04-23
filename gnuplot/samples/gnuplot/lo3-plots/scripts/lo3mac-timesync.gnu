jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps color
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium color

set size 0.75, 0.75


#set yrange [0:1]
#set xrange [5:35]
#set logscale y


set ylabel "CDF"
set xlabel "Time Sync Latency"

set grid

set output '../graphs/time-sync-difference-error-cdf.eps'

plot '../plot-data/timesyncR1D2E0.05S4.cdf.data' using 1:2 t'E5' with lines, '../plot-data/timesyncR1D2E0.1S4.cdf.data' using 1:2 t'E10' with lines, '../plot-data/timesyncR1D2E0.2S4.cdf.data' using 1:2 t'E20' with lines
     #'../plot-data/flowreqlatencyR0.5D2E0S4.cdf.data' using 1:2 t'R0.5' with linespoint lt 1 lw 3 pt 9,\
     


