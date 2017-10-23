.PHONY: all

all: paper.pdf

paper.pdf: paper.tex 
	pdflatex -src -interaction=nonstopmode paper.tex
	biber paper.bcf
	pdflatex -src -interaction=nonstopmode paper.tex
	pdflatex -src -interaction=nonstopmode paper.tex
