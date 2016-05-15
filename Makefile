.PHONY : all clean

all : scala_text.pdf

clean :
	latexmk -C
	rm -r img target *.pdf *.pdf_tex book.json

scala_text.pdf :
	latexmk -pdf scala_text.tex

