#!/usr/bin/gnuplot
# vim: ft=gnuplot

# <https://newspaint.wordpress.com/2013/09/11/creating-a-filled-stack-graph-in-gnuplot/>

sep = ","
set datafile separator sep
data_file = "data/browser-usage.data"
#N = 5
N = system(sprintf("awk -F%s 'NR==1{print NF}' %s", sep, data_file))

set title "Browser usage evolution (in %)"
set xdata time
set timefmt "%Y"
set ylabel "%"
set xlabel "Date"
set xrange ["2002":"2012"]
set yrange [0:100]
set pointsize 0.8
set format x "%Y"
set format y "%.2f"
set border 11
set xtics out
set tics front
set key below
plot \
  for [i=N:2:-1] \
    data_file using 1:(sum [col=2:i] column(col)) \
      title columnheader(i) \
      with filledcurves x1, \
  for [i=N:2:-1] \
    data_file using 1:(sum [col=2:i] column(col)) \
      notitle \
      with linespoints lc rgb "#000000" lt -1 lw 1 pt 7 ps 0.5
