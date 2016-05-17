#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from pandocfilters import toJSONFilter, CodeBlock, RawBlock, Str, RawInline

def mkListingsEnvironment(code):
    return RawBlock('latex', "\\begin{lstlisting}[style=scala]\n" + code + "\n\\end{lstlisting}\n")

def mkInputListings(src):
    return RawInline('latex', "\\lstinputlisting[style=scala]{" + src + "}")

def mkIncludegraphics(src):
    return RawInline('latex', "\\includegraphics{img/" + src + "}")

def filter(key, value, fmt, meta):
    if key == 'CodeBlock':
        [[ident, classes, kvs], code] = value
        if 'scala' in classes:
            return mkListingsEnvironment(code)
    elif key == 'Link':
        [_, text, [href, _]] = value
        if text == [Str("include")]:
            return mkInputListings(href)
    elif key == 'Image':
        [_, _, [src, _]] = value
        if src.startswith("http"):
            fileName = src.split("/")[-1]
            os.system("cd img && curl -O " + src)
            return mkIncludegraphics(fileName)
    elif key == 'Str':
        return(Str(value.replace(u"〜", u"～")))

if __name__ == "__main__":
    toJSONFilter(filter)
