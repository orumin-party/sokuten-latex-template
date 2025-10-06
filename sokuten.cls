\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sokuten}[2023/01/01]

% ページサイズとマージンの設定
\newlength\sokuten@margin
\newlength\sokuten@p@gewidth
\newlength\sokuten@p@geheight
\setlength{\sokuten@p@gewidth}{182mm}
\setlength{\sokuten@p@geheight}{257mm}
\setlength{\sokuten@margin}{18mm}

\DeclareOption{nuritashi}{
    \addtolength{\sokuten@p@gewidth}{6mm}
    \addtolength{\sokuten@p@geheight}{6mm}
    \addtolength{\sokuten@margin}{3mm}
}
\ProcessOptions\relax

% 必要なパッケージのロード
\LoadClass[%
    fontsize=13Q,%
    paper={\sokuten@p@gewidth, \sokuten@p@geheight},%
    gutter=\sokuten@margin,%
    fore-edge=\sokuten@margin,%
    head_space=\sokuten@margin,%
    foot_space=\sokuten@margin,%
    twoside,%
    twocolumn]{jlreq}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{listings}
\RequirePackage{titlesec}

\renewcommand{\hrulefill}{%
\global\@tempdima.32\zh \advance \@tempdima .2pt 
\leavevmode \kern .33\zw \leaders\hrule height \@tempdima depth -.30\zh \hfill \kern .5\zw
}

% 標準のページスタイルの再定義
\def\ps@plainfoot{%
	\let\@evenhead\@empty
	\let\@oddhead\@empty
	\def\@evenfoot{\thepage\quad\small{\color[gray]{0.2}}\leftmark\hss}%
	\def\@oddfoot{\hfil{\small\color[gray]{0.2}\rightmark}\quad\thepage}%
	\let\@mkboth\@gobbletwo
	\def\sectionmark##1{\markboth{{\slshape \expandafter\@title}}{##1}}
	\let\subsectionmark\@gobble
}
\let\ps@plain\ps@plainfoot

% 記事通し番号の追加
\newcommand*{\volume}[1]{\gdef\@volume{#1}}

% タイトルのフォーマット
\def\@maketitle{%
    \newpage\null
    % \vskip 2em
    \parindent\z@
    \let\footnote\thanks
    \normalfont\gtfamily\bfseries
    \fontsize{20pt}{\baselineskip}\selectfont
    \raggedright
    \ifx\@volume\undefined
        {\@title}
    \else
        \global\setbox\@currbox=\hbox{\@volume: }
        \setlength{\hangindent}{\wd\@currbox}
        {\@volume : \@title}
    \fi
    \par\nobreak
    {\normalfont\ttfamily\large
    \par\setlength{\parindent}{\wd\@currbox}
    \setlength{\hangindent}{\parindent}
    \addtolength{\hangindent}{1.25\jlreq@zw}
    {\hrulefill {\@author}}}
    \par\vskip 1.5em
    \ifvoid\jlreq@abstractbox\else\unvbox\jlreq@abstractbox\fi
}

\renewcommand{\maketitle}{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\advance\leftskip 3\zw
    \parindent 1\jlreq@zw\noindent
    \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3\jlreq@zw}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@ % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  % \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% 章・節記号の置き換え
\ModifyHeading{section}{%
lines=3,%
font=\normalfont\gtfamily\bfseries\large,%
format={%
\begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \fill[black!80] (0, -4pt) rectangle (8pt, 12pt);
    \fill[black!80, line width=1pt] (0, -4pt) -- (\linewidth, -4pt);
\end{tikzpicture}%
\hspace{1\jlreq@zw}#2}}
\ModifyHeading{subsection}{%
font=\normalfont\gtfamily\bfseries\large,%
format={%
\begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \fill[black!30] (0, -4pt) rectangle (6pt, 12pt);
    \draw[black!30,line width=0.5pt] (0, -4pt) -- (\linewidth,-4pt);
\end{tikzpicture}%
\hspace{1\jlreq@zw}#2}}

% ソースコード貼り付け環境の再設定
\lstset{
	basicstyle=\ttfamily\footnotesize,
	commentstyle=\textit,
	classoffset=1,
	keywordstyle=\bfseries,
	frame=tb,
	framesep=5pt,
	showstringspaces=false,
	tabsize=2,
	aboveskip=0.75\jlreq@zw,
	belowskip=1.75\jlreq@zw,
	backgroundcolor=\color[gray]{0.9},
	breaklines=true, % 長い行の自動改行を有効化
	breakautoindent=true
}
\renewcommand{\lstlistingname}{リスト} % キャプションに表示される名前を変更
\newcommand{\listref}[1]{\lstlistingname{}~\ref{#1}}
\newcommand{\figref}[1]{\figurename~\ref{#1}}
\newcommand{\tabref}[1]{\tablename~\ref{#1}}

\lstnewenvironment{console}[1][]{
	% リストカウンタの退避先を作る
	\ifx\c@tmpcnta\undefined
		\newcounter{tmpcnta}
	\fi
	\let\c@tmpcnta\c@lstlisting
	\let\c@lstlisting\c@figure
	\renewcommand{\lstlistingname}{\figurename}
	\lstset{
		backgroundcolor=\color[gray]{0.2},
		basicstyle=\ttfamily\footnotesize\color{white},
		breakindent=0pt,
		#1
	}
}{
	\let\c@lstlisting\c@tmpcnta
	\let\c@tmpcnta\z@
}

\renewcommand*{\thefootnote}{\lower.5ex\hbox{*}\arabic{footnote}\hbox{}\inhibitglue}
