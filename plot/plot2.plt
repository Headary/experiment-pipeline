set terminal epslatex size 15.0 cm, 7.0 cm

#range of data
set xrange [*:*]
set yrange [*:*]

#fit
f(x) = A*x**2 + B*x + C
fit [*:*] f(x) 'plot/plot2.dat' using 1:2:3 yerror via A,B,C

#key
set key
set key bottom right

#labels of axis
set xlabel '\popi{t}{s}' 
set ylabel '\popi{s}{m}' rotate by 0

set grid 
#main spacing
#set xtics 5
#set ytics 5
#secondary lines
#set mxtics 5
#set mytics 5

#lines styles
set style line 1 lc rgb '#dd0000' lt 1 lw 2

plot 'plot/plot2.dat' w yerrorbars ls 1, f(x) ls 1 title 'fit'
