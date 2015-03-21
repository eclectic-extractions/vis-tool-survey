PGG_TARGETS:= gfx/line-plot/pdl-graphics-gnuplot.png gfx/image-display/pdl-graphics-gnuplot.png
PYGAL_TARGETS:= gfx/line-plot/pygal_example.svg

all: $(PGG_TARGETS) $(PYGAL_TARGETS)

gfx/%.png: %.pl
	mkdir -p `dirname $@`
	perl $< $@

gfx/%.svg: %.py
	mkdir -p `dirname $@`
	python $< > $@
