TARGETS:= gfx/line-plot/pdl-graphics-gnuplot.png gfx/image-display/pdl-graphics-gnuplot.png

all: $(TARGETS)

gfx/%.png: %.pl
	mkdir -p `dirname $@`
	perl $< $@
