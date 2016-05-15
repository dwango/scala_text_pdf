#!/bin/bash

set -e

cd ./scala_text
sbt tut
cd -
cp ./scala_text/src/book.json ./
cp -r ./scala_text/src/img ./
for f in ./img/*.svg
do
  if [[ $f =~ (.*)\.svg ]]; then
    inkscape -z -D --file=`pwd`/${BASH_REMATCH[1]}.svg --export-pdf=`pwd`/${BASH_REMATCH[1]}.pdf --export-latex
  fi
done
mkdir target
for f in ./scala_text/gitbook/*.md
do
  if [[ $f =~ \./scala_text/gitbook/(.*)\.md ]]; then
    cp $f ./target/
    pandoc -o "./target/${BASH_REMATCH[1]}.tex" -f markdown_github+fenced_code_attributes+footnotes-hard_line_breaks --latex-engine=lualatex $f
  fi
done

