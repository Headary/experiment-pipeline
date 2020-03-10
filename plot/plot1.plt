set terminal epslatex size 15.0 cm, 7.0 cm

#range of data
set xrange [0:5]
set yrange [0:25]

#fit
#f(x) = A*x**2 + B*x + C
#fit [*:*] f(x) 'datafile.txt' using 1:2 via A,B,C

#key
set key
set key bottom right

#labels of axis
set xlabel '\popi{t}{h}' 
set ylabel '\popi{s}{m}' rotate by 0

set grid 
#main spacing
#set xtics 5
#set ytics 5
#secondary lines
#set mxtics 5
#set mytics 5

#lines styles
set style line 1 lc rgb '#0000dd' lt 1 lw 2
#set style line 2 lc rgb '#dd0000' lt 1 lw 2

plot x**2 ls 1 title "Kvadratická funkce"
