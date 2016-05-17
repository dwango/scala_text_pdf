Scala Text PDF
========================

[![Build Status](https://travis-ci.org/y-yu/scala_text_pdf.svg?branch=master)](https://travis-ci.org/y-yu/scala_text_pdf)

[Scala Text](https://github.com/dwango/scala_text)のPDF版です。

## 成果物

- [scala_text.pdf](https://y-yu.github.io/scala_text_pdf/scala_text.pdf)

## コンパイル

コンパイルには次のものが必要です。

- [TeXLive](https://www.tug.org/texlive/)（または[MacTeX](https://tug.org/mactex/)）
- [Inkscape](https://inkscape.org/ja/)
- [Pandoc](http://pandoc.org/index.html)
- [sbt](http://www.scala-sbt.org/)
- [Python](https://www.python.org/)
- [pandocfilters](https://github.com/jgm/pandocfilters)

これらをインスールして、次のコマンドでPDFファイルを作成できます。

```
$ ./setup.sh
$ make all
```

ただし、標準でOSXのヒラギノフォントを利用してコンパイルが行なわれます。
OSXではない場合や、ヒラギノフォントが使用できない場合は下記の方法で、
TeXLive付属のIPAフォントまたは游フォントを利用したコンパイルを行ってください。

### 游フォントを利用する

次のように環境変数を設定してから`make`を実行してください。

```
$ export USE_YUFONT=true
```

### IPAフォントを利用する

次のように環境変数を設定してから`make`を実行してください。

```
$ export USE_IPAFONT=true
```

## ライセンス

[Scala Text](https://github.com/dwango/scala_text)のライセンスを継承し
[CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/deed.ja)の元で配布されています。

![CC-BY-NC-SA](https://licensebuttons.net/l/by-nc-sa/3.0/88x31.png)

