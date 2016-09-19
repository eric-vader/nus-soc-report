FILE=report

$(FILE).pdf: $(FILE).tex $(FILE).aux $(FILE).toc $(FILE).bbl 
	pdflatex -shell-escape $(FILE).tex
	pdflatex -shell-escape $(FILE).tex

$(FILE).bbl: $(FILE).bib
	bibtex $(FILE)

$(FILE).aux: $(FILE).tex
	pdflatex -shell-escape $(FILE).tex

$(FILE).toc: $(FILE).aux
	pdflatex -shell-escape $(FILE).tex

reset: clean
	rm -f $(FILE).pdf

clean:
	rm -f $(FILE).toc $(FILE).log $(FILE).aux $(FILE).lof $(FILE).lot $(FILE).bbl $(FILE).blg $(FILE).dvi
