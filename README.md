# 機関誌『測点』テンプレート LaTeX版

このテンプレートを使うとフォーマットとして問題ない原稿が簡単に作成できます。

```
+- images/         # 画像ファイル
    +- sample.png  # サンプル画像
+- sample.adoc     # サンプルファイル
+- manuscript.adoc # 原稿ファイル
+- Makefile        # プレビュー用Makefile
+- latexmk         # latexmkビルド設定ファイル
```

## Prerequisites

TODO: Specify the version of TeX Live. omasanori confirmed that this works with 2024 and 2025.

## How to build

```
latexmk -pdf manuscript
```

すると5回くらいビルドが入ってmanuscript.pdfが生まれる
