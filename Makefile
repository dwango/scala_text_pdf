.PHONY : all clean

all : scala_text.pdf

clean :
	latexmk -C

scala_text.pdf :
	latexmk -pdf scala_text.tex

