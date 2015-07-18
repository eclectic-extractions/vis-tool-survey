#!/usr/bin/gnuplot
# vim: ft=gnuplot

# <https://newspaint.wordpress.com/2013/09/11/creating-a-filled-stack-graph-in-gnuplot/>

set title "Browser usage evolution (in %)"
set xdata time
set timefmt "%Y"
set datafile separator ","
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
  for [i=2:5:1] \
    "stacked-line-chart/stack.data" using 1:(sum [col=i:5] column(col)) \
      title columnheader(i) \
      with filledcurves x1, \
  for [i=2:5:1] \
    "stacked-line-chart/stack.data" using 1:(sum [col=i:5] column(col)) \
      notitle \
      with lines lc rgb "#000000" lt -1 lw 1
