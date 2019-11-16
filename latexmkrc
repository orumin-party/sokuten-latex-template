#! /usr/bin/env perl
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -shell-escape -file-line-error -halt-on-error %S';
$latex = 'uplatex %O -interaction=nonstopmode -synctex=1 %S';
$max_repeat = 5;
$pdf_mode = 4;
