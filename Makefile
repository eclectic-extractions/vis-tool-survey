PGG_TARGETS:= gfx/line-plot/pdl-graphics-gnuplot.png gfx/image-display/pdl-graphics-gnuplot.png
PYGAL_TARGETS:= gfx/line-plot/pygal_example.svg
MATLAB_TARGETS:= gfx/image-display/matlab-matlab.png
OCTAVE_TARGETS:= gfx/image-display/matlab-octave.png

all: $(PGG_TARGETS) $(PYGAL_TARGETS) $(MATLAB_TARGETS) $(OCTAVE_TARGETS)

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
