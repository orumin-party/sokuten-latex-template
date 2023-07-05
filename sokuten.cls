%% 機関誌『測点』用LaTeXクラスファイル
%%
%% Based on https://github.com/anlp-nenji/nlproceedings
%%
%% Copyright 2020-2021 Takuto ASAKURA
%% Copyright 2023      Masanori Ogino
%% SPDX-License-Identifier: MIT

\RequirePackage{expl3,xparse}

\NeedsTeXFormat{LaTeX2e}
\ProvidesExplPackage {sokuten} {2023-07-06} {0.1.0}
  {Document class for Sokuten}

\LoadClass
  [
    paper=b5j,
    twocolumn,
    fontsize=10pt,
    jafontscale=0.9,
    baselineskip=1.75zh,
    head_space=18mm,
    foot_space=18mm,
    gutter=18mm,
    fore-edge=18mm,
  ]{jlreq}

\pagestyle{empty}

\RequirePackage{graphicx}
\RequirePackage{xcolor}

\RequirePackage[unicode]{hyperref}

\RequirePackage{luatexja-ruby}
\RequirePackage{luatexja-otf}
\RequirePackage[deluxe]{luatexja-preset}

\RequirePackage[full]{textcomp}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage
  [
    warnings-off={mathtools-colon,mathtools-overbracket},
    math-style=ISO,
    bold-style=ISO
  ]{unicode-math}

\setmainfont[Ligatures=TeX, Scale=0.95]{TeX Gyre Termes}
\setsansfont[Ligatures=TeX, Scale=0.95]{TeX Gyre Heros}
\setmonofont[Ligatures=TeX, Scale=1]{TeX Gyre Cursor}
\setmathfont{TeX Gyre Termes Math}

\RequirePackage{listings}

\lstset{
	basicstyle=\ttfamily\footnotesize,
	commentstyle=\textit,
	classoffset=1,
	keywordstyle=\bfseries,
	frame=tb,
	framesep=5pt,
	showstringspaces=false,
	tabsize=2,
	aboveskip=0.75\zw,
	belowskip=1.75\zw,
	backgroundcolor=\color[gray]{0.9},
	breaklines=true,
	breakautoindent=true
}
\renewcommand{\lstlistingname}{ソースコード}
\def\lst@lettertrue{\let\lst@ifletter\iffalse}

%\usepackage{titlesec, titletoc}
%\usepackage{fancyvrb}
%\usepackage{fvextra}
%\usepackage{bxjalipsum}
%\usepackage{luacode}
%\RequirePackage{titlesec}
%\RequirePackage{fancyvrb}

%\newif\if@popls\@poplsfalse
%\DeclareOption{preprint}{
%	\@poplstrue
%}
%\ExecuteOptions{}
%\ProcessOptions\relax

%\if@popls
%	% b5j(W : 182mm, H : 257mm)を上下左右3mmずつ伸ばす
%	\setlength{\paperwidth}{188truemm}
%	\setlength{\paperheight}{263truemm}
%	% ページ左からのアキに3mmを加える
%	\addtolength{\oddsidemargin}{3truemm}
%	\setlength{\evensidemargin}{\oddsidemargin}
%	% ページ上からのアキに3mmを加える
%	\addtolength{\topmargin}{3truemm}
%	% papersize specialを発行してdviファイルの用紙サイズも変更
%	\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
%\fi

% フッターにノンブルを入れるので本文領域から少し下にずらす
%\addtolength{\footskip}{2\zh}

% TODO: もう少し重た目にする。見出しフォントはよりボールドに
% 各見出しはすべてボールドにするくらいでよい

%\renewcommand{\hrulefill}{%
%\global\@tempdima.32\zh \advance \@tempdima .2pt 
%\leavevmode \leaders\hrule height \@tempdima depth -.30\zh \hfill \kern .5\zw
%}

%\def\@makechapterhead#1{%
%	{\parindent \z@ \raggedright
%	\normalfont\gtfamily\bfseries\Huge
%	\interlinepenalty\@M
%	\global\setbox\@currbox=\hbox{\thechapter: }
%	\setlength{\hangindent}{\wd\@currbox}
%	{\thechapter : {#1}}
%	\@makechapterauthor
%	\parindent \z@
%	\par\nobreak
%	\vskip 1\Cvs}
%	}

%\def\@makechapterauthor{%
%	\normalfont\ttfamily\large
%	\par\setlength{\parindent}{\wd\@currbox}
%	\setlength{\hangindent}{\parindent}
%	\addtolength{\hangindent}{1.25\zw}
%	{\hrulefill {\@author}}
%}

%\titleformat{\section}[hang]{\normalfont\gtfamily\bfseries\fontsize{\@xivpt\jsc@mpt}{\n@baseline\jsc@mpt}\selectfont}%
%{\rule[2.4truept]{5truept}{5truept}}%
%{.34\zw}{}[]
%\titleformat{\subsection}[hang]{\normalfont\large\gtfamily\bfseries}%
%{\color[gray]{0.6}{\rule[1.65truept]{5truept}{5truept}}}%
%{4.76truept}{}[]

%\def\ps@plainfoot{%
%	\let\@mkboth\@gobbletwo
%	\let\@evenhead\@empty
%	\let\@oddhead\@empty
%	\def\@evenfoot{\thepage\quad\small{\color[gray]{0.2}}\leftmark\hss}%
%	\def\@oddfoot{\hfil{\small\color[gray]{0.2}\rightmark}\quad\thepage}%
%}
%\let\ps@plain\ps@plainfoot
%\renewcommand{\chaptermark}[1]{\markboth{\textsc{\expandafter\@title}}{#1}}
%\renewcommand{\sectionmark}[1]{\chaptermark{#1}}

%\fvset{fontsize=\footnotesize,
%		breaklines=true,
%		breakanywhere=true,
%		breaksymbolleft=}
