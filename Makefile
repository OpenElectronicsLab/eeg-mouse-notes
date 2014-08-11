all: bilinear-filter-notes

bilinear-filter-notes: bilinear-filter-notes.tex
	pdflatex bilinear-filter-notes.tex

clean:
	rm -vf bilinear-filter-notes.{pdf,aux,log,nav,out,snm,toc,vrb,dvi}

