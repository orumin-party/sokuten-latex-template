# 機関誌『測点』テンプレート LaTeX版

このテンプレートを使うとフォーマットとして問題ない原稿が簡単に作成できます。

```
+- images/         # 画像ファイル
    +- sample.png  # サンプル画像
+- sample.tex      # サンプルファイル
+- manuscript.tex  # 原稿ファイル
+- latexmkrc       # latexmkビルド設定ファイル
```

## Prerequisites

- TeX Live 2023 full

## How to build

```
latexmk -pdflua manuscript
```

すると5回くらいビルドが入ってmanuscript.pdfが生まれる
