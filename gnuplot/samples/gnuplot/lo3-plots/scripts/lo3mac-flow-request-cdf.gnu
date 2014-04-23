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
set xrange [0:35]
#set logscale y

set key  bottom

#set xtic 0.5

set ylabel "Probability"
set xlabel "Flow Request Latency (seconds)"

set grid

set output '../graphs/flowrequestlatency.cdf.eps'

plot '../plot-data/flowreqlatencyR2D2E0S4.cdf.data' using ($1/1000):($2/100) t'mct = 2 hrs' with lines lt 1 lw 3, \
     '../plot-data/flowreqlatencyR1.5D2E0S4.cdf.data' using ($1/1000):($2/100) t'mct = 1 hr 30 min' with lines lt 2 lw 3, \
     '../plot-data/flowreqlatencyR1.25D2E0S4.cdf.data' using ($1/1000):($2/100) t'mct = 1 hr 15 min' with lines lt 3 lw 3, \
     '../plot-data/flowreqlatencyR1D2E0S4.cdf.data' using ($1/1000):($2/100) t'mct = 1 hr' with lines lt 4 lw 3, \
     '../plot-data/flowreqlatencyR0.75D2E0S4.cdf.data' using ($1/1000):($2/100) t'mct = 45 min' with lines lt 5 lw 3

#     '../plot-data/flowreqlatencyR0.5D2E0S4.cdf.data' using ($1/1000):($2/100) t'mc 45 min' with lines lt 3 lw 3

     #'../plot-data/flowreqlatencyR0.5D2E0S4.cdf.data' using 1:2 t'R0.5' with linespoint lt 1 lw 3 pt 9,\
     


