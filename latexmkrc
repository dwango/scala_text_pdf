#!/usr/bin/env perl

$pdflatex = 'lualatex %O -synctex=1 %S --interaction=nonstopmode';
$pdf_mode = 3;
$bibtex = 'pbibtex';
