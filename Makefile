PGG_TARGETS:= gfx/line-plot/pdl-graphics-gnuplot.png gfx/image-display/pdl-graphics-gnuplot.png
PYGAL_TARGETS:= gfx/line-plot/pygal_example.svg gfx/stacked-line-chart/pygal_example.svg
MATLAB_TARGETS:= gfx/image-display/matlab-matlab.png
OCTAVE_TARGETS:= gfx/image-display/matlab-octave.png
R_TARGETS:= gfx/image-display/r-graphics.svg gfx/bar-plot/r-graphics.svg gfx/line-plot/ggplot2.svg
GP_TARGETS:= gfx/line-plot/gnuplot.svg gfx/stacked-line-chart/gnuplot.svg


all: $(PGG_TARGETS) $(PYGAL_TARGETS) $(MATLAB_TARGETS) $(OCTAVE_TARGETS) $(R_TARGETS) \
	$(GP_TARGETS)

gfx/%.svg: %.gp
	mkdir -p `dirname $@`
	gnuplot -e "set term svg; set output '$@';" $<

gfx/%.svg: %.R
	mkdir -p `dirname $@`
	Rscript -e "svg('$@'); source('$<')"

gfx/%-octave.png: %.m
	mkdir -p `dirname $@`
	octave --eval "addpath('`dirname $<`'); matlab('$@'); exit"

gfx/%-matlab.png: %.m
	mkdir -p `dirname $@`
	matlab -nosplash -nodesktop -r "addpath('`dirname $<`'); matlab('$@'); exit"

gfx/%.png: %.pl
	mkdir -p `dirname $@`
	perl $< $@

gfx/%.svg: %.py
	mkdir -p `dirname $@`
	python $< > $@
