for i in * 
do
    test -d $i && awk '{if(NR==1){print $0}}' "$i/makefile-correction.txt"|cut -d= -f2|xargs echo $i:|sed -n 's/ //gp'
done
