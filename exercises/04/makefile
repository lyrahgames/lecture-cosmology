GNUPLOT_FILES = $(shell find -name "*.gp")
PLOT_BASENAMES = $(basename $(GNUPLOT_FILES))
PLOT_FILES = $(addsuffix .pdf,$(PLOT_BASENAMES))

.PHONY: all clean

all: $(PLOT_FILES)

clean:
	for name in $(PLOT_BASENAMES); do\
		rm -f $$name.tex;\
		rm -f $$name.eps;\
		rm -f $$name.aux;\
		rm -f $$name.log;\
		rm -f $$name-eps-converted-to.pdf;\
		rm -f $$name.pdf;\
	done

%.pdf: %.gp
	rm -f $@
	cd $(*D) && gnuplot -e "set terminal epslatex size 10cm,10cm; set output '$(*F).tex'" $(<F)
	sed -i '1i \
	\\documentclass{standalone}\
	\\usepackage{utilities}\
	\\usepackage{graphicx}\
	\\begin{document}' $*.tex
	sed -i '$$a \
	\\end{document}' $*.tex
	cd $(*D) && pdflatex $(*F).tex
	rm -f $*.tex
	rm -f $*.eps
	rm -f $*.aux
	rm -f $*.log
	rm -f $*-eps-converted-to.pdf