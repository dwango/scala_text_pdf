#!/bin/bash

set -e

git submodule update --init

cd ./scala_text
../sbt tut
cd ..
cp ./scala_text/book.json ./
cp -r ./scala_text/src/img ./
cp -r ./scala_text/src/example_projects ./
for f in ./img/*.svg
do
  if [[ $f =~ \./img/(.*)\.svg ]]; then
    inkscape -z -D --file=`pwd`/img/${BASH_REMATCH[1]}.svg --export-pdf=`pwd`/${BASH_REMATCH[1]}.pdf --export-latex=`pwd`/${BASH_REMATCH[1]}.pdf_tex
  fi
done

if [[ ! -d "./target" ]]; then
  mkdir target
fi

for f in ./scala_text/gitbook/*.md
do
  if [[ $f =~ \./scala_text/gitbook/(.*)\.md ]]; then
    cp $f ./target/
    FILENAME="${BASH_REMATCH[1]}.md" pandoc -o "./target/${BASH_REMATCH[1]}.tex" -f markdown_github+footnotes+header_attributes-hard_line_breaks-intraword_underscores --pdf-engine=lualatex --top-level-division=chapter --listings --filter ./filter.py $f
  fi
done

