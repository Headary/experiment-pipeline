name=beamer

datafiles = table.tex plot/plot2.dat

plt=$(wildcard plot/*.plt)
svg=$(wildcard graphics/*.svg)
plttex=$(patsubst plot/%.plt, plot/out/%.tex, $(plt))
eps+=$(patsubst %.svg, %.eps, $(svg))

LATEX = pdflatex -output-directory build/ $(name).tex

build/$(name).pdf:  $(eps) $(datafiles) $(plttex) $(name).tex
	cp build/$(name).aux build/$(name)_old.aux
	$(LATEX)
	if ! cmp -s 'build/$(name).aux' 'build/$(name)_old.aux'; then $(LATEX); fi
	
%.eps: %.svg
	inkscape $< -E $@ --export-ignore-filters

plot/out/%.tex plot/out/%.eps: plot/%.plt plot/%.dat
	mkdir -p plot/out/
	gnuplot -e "set output 'plot/out/$*.tex'" $<

table*.tex plot/*.dat: $(wildcard data/**/*) data/data.py
	python3 data/data.py
