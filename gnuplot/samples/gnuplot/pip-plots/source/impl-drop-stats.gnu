eps_type=2
op_type = eps_type

if(op_type == eps_type) \
        set term postscript eps monochrome

set output 'impl-drop-stats2.eps'
set size 0.75, 0.75


set key right top

set style data boxes
set boxwidth 0.15
#set xtics ("1" 1, "2" 2, "5.5" 3, "11" 4,\
#"1" 6, "2" 7, "5.5" 8, "11" 9, \
#"1" 11, "2" 12, "5.5" 13, "11" 14,\
# "1" 16, "2" 17, "5.5" 18, "11" 19 )

set bmargin 4
#set label "Err = 1%" at screen 0.14, screen 0.08
#set label "Err = 5%" at screen 0.29, screen 0.08
#set label "Err = 10%" at screen 0.42, screen 0.08
#set label "Err = 20%" at screen 0.56, screen 0.08


set ylabel "Packet Drop (%)"
set xlabel "Node Id"
#set xrange [0:5]
#set noxtics
set grid

plot \
'data/impl-loss-stats.txt' using ($1-0.17):(($2+$3)/10) w boxes fs pattern 3 title "Total", \
'data/impl-loss-stats.txt' using ($1):($2/10) w boxes fs pattern 1 title "Overflow", \
'data/impl-loss-stats.txt' using ($1+0.17):($3/10) w boxes fs pattern 2 title "Retry-Limit"


