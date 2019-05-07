%%
%% This is file `adelaide-mecheng-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% adelaide-mecheng-thesis.dtx  (with options: `package')
%% 
%%   _______________________________________________
%%   Copyright (C) 2011  Will Robertson & Zebb Prime
%% 
%%   License information appended.
%% 
%% 
\ProvidesPackage{adelaide-mecheng-thesis}
\ProvidesClass{adelaide-mecheng-thesis}

\newif\if@print
\newif\if@mxt@sppa
\newcount\mxt@thesistype

\DeclareOption{print}{\@printtrue}
\DeclareOption{noprint}{\@printfalse}
\ProcessOptions

\LoadClass[a4paper,11pt,twoside,onecolumn,openright]{memoir}

\RequirePackage{keyval}
\define@key{mecheng}{author}{\def\@author{#1}}
\define@key{mecheng}{title}{\def\@title{#1}}
\define@key{mecheng}{submission-date}{\def\@submissiondate{#1}}
\define@key{mecheng}{version-date}{\def\@versiondate{#1}}
\define@key{mecheng}{group-name}{\def\@groupname{#1}}
\define@key{mecheng}{keywords}{\def\@keywords{#1}}
\define@key{mecheng}{wordcount}{\def\@wordcount{#1}}
\define@key{mecheng}{wordlimit}{\def\@wordlimit{#1}}
\define@key{mecheng}{deed-poll}[]{\@mxt@sppatrue}
\define@key{mecheng}{phd}     []{\mxt@thesistype=0\relax}
\define@key{mecheng}{progress}[]{\mxt@thesistype=1\relax}
\define@key{mecheng}{masters} []{\mxt@thesistype=2\relax}
\define@key{mecheng}{honours-final} []{\mxt@thesistype=3\relax}
\define@key{mecheng}{honours-prelim} []{\mxt@thesistype=4\relax}

\newcommand\thesisdetails{\setkeys{mecheng}}
\thesisdetails{
  group-name = {},
  keywords   = {},
  version-date = \today,
}

\@onlypreamble\thesisdetails

\AtBeginDocument{
  \hypersetup{
    pdfauthor={\@author},
    pdftitle={\@title},
    pdfsubject={PhD Thesis},
    pdfkeywords={\@keywords}
  }
}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern,textcomp}
\RequirePackage[sc]{mathpazo}
\linespread{1.1}% Palatino font
\frenchspacing

\RequirePackage{graphicx,enumitem,refstyle,microtype,subfig,booktabs,xcolor}

\PassOptionsToPackage{tableposition=top}{caption}

\nouppercaseheads
%%%% Fix up the footnote referencing

%%%% Where environment for lists following equations.
\newenvironment{where}[1][]
  {%\vspace{-\baselineskip}
   \begin{description}[
     font=\normalfont,
     labelindent=\parindent,
     labelsep=1ex,
     nolistsep,#1]}
  {\end{description}}

%%%% Set up hyperref, and make links dark colours
\RequirePackage{hyperref,bookmark}
\if@print
  \hypersetup{linkcolor=black,citecolor=black,filecolor=black,urlcolor=black} % Black links
\else
  \definecolor{darkred}{rgb}{0.4,0.16,0.16}
  \definecolor{darkgreen}{rgb}{0.16,0.4,0.256}
  \definecolor{darkblue}{rgb}{0.16,0.256,0.4}
  \hypersetup{linkcolor=darkred,citecolor=darkblue,filecolor=black,urlcolor=darkgreen} % Dark links
\fi

%%%% General PageStyle
\copypagestyle{ruledmod}{ruled}
\makepsmarks{ruledmod}{%
 \let\@mkboth\markboth
 \def\chaptermark##1{%
   \markboth{%
     Chapter~\thechapter\enspace ##1}{}}% left marks
 \def\sectionmark##1{\markright{% % right mark
 \ifnum \c@secnumdepth>\z@
   \thesection\enspace % section number
 \fi
 ##1}}}
\g@addto@macro\mainmatter{\pagestyle{ruledmod}}
\g@addto@macro\backmatter{\movetooddpage[\thispagestyle{empty}]}

\chapterstyle{ruledmod}
\maxsecnumdepth{subsubsection}

\addtolength{\spinemargin}{0.6cm}
\addtolength{\foremargin}{-0.6cm}
\checkandfixthelayout
\AtBeginDocument{\renewcommand\bibname{References}}
\newref{sec}{%
  name    = \RSsectxt,
  names   = \RSsecstxt,
  Name    = \RSSectxt,
  Names   = \RSSecstxt,
  refcmd  = {\ref{#1}},
  rngtxt  = \RSrngtxt,
  lsttxt  = \RSlsttxt}
%%-- TEMPLATE FOR FIGURES -----------------------
   \newref{fig}{%
      name      = \RSFigtxt,
      names     = \RSFigstxt,
      Name      = \RSFigtxt,
      Names     = \RSFigstxt,
      rngtxt    = \RSrngtxt,
      lsttwotxt = \RSlsttwotxt,
      lsttxt    = \RSlsttxt}
%%-- TEMPLATE FOR TABLES ------------------------
   \newref{tab}{%
      name      = \RSTabtxt,
      names     = \RSTabstxt,
      Name      = \RSTabtxt,
      Names     = \RSTabstxt,
      rngtxt    = \RSrngtxt,
      lsttwotxt = \RSlsttwotxt,
      lsttxt    = \RSlsttxt}

\setfloatadjustment{figure}{\centering}
\setfloatadjustment{table}{\centering}

\renewcommand\maketitle{%
\begin{titlingpage}
\makeatletter
\calccentering\unitlength
\begin{adjustwidth}{\unitlength}{-\unitlength}
\begin{adjustwidth}{1cm}{}
{
  \centering
  \vfill
  \IfFileExists{logo.pdf}{%
    \includegraphics{logo}%
  }{%
    \fbox{\parbox[c]{8cm}{\bfseries University logo not found; please download one from \url{http://www.adelaide.edu.au/vi/logo/downloads/} and call it \texttt{logo.pdf} in the same directory as this document.}}
  }
  \vfill
  {\huge \@title\par}
  \vfill
  \textsc{\Large \@author}\\
  \vfill
  {School of Mechanical Engineering\\The University of Adelaide\\South Australia 5005\\Australia}\\
  \vfill
  \par
  \itshape
  \footnotesize
    \ifcase\mxt@thesistype
      Thesis submitted in partial fulfillment of the\\
      requirements for the degree of Ph.\,D. in\\
      Engineering
    \or
      Progress report submitted in partial fulfillment of the\\
      requirements for the degree of Ph.\,D. in\\
      Engineering
    \or
      Thesis submitted in partial fulfillment of the\\
      requirements for the degree of Masters in\\
      Engineering
    \or
      A report submitted in partial fulfillment of the\\
      requirements for the degree of Bachelor of\\
      Engineering
    \or
      A report submitted in partial fulfillment of the\\
      requirements for the degree of Bachelor of\\
      Engineering
    \fi
    on \@submissiondate.
  \par
}
\end{adjustwidth}
\end{adjustwidth}
\newpage
{\small \noindent
\ifcase\mxt@thesistype
  \textbf{Ph.\,D. Thesis}
\or
  \textbf{Ph.\,D. Progress Report}
\or
  \textbf{Masters Thesis}
\or
  \textbf{Honours Project Final Report}
\or
  \textbf{Honours Project Preliminary Report}
\fi
\medskip\\
\@versiondate\medskip\\
\ifx\@groupname\@empty
  \expandafter\@gobble
\else
  \expandafter\@firstofone
\fi
{\@groupname\\}
School of Mechanical Engineering\\
The University of Adelaide\\
South Australia 5005\\
Australia\\}
\vfill
\vfill\noindent
{\footnotesize Written and typeset using \LaTeX.}
\vfill\noindent
\tiny
Copyright \textcopyright\ \the\year\ \@author\if@mxt@sppa, and The University of Adelaide, Australia\fi.\\[\medskipamount]
\parbox{80mm}{\tiny
\textit{All right reserved. No part of this report may be used or reproduced in any form or by any means, or stored in a database or retrieval system without prior written permission of the copyright holders except in the case of brief quotations embodied in critical articles and reviews.}
}
\end{titlingpage}%
}

\def\makedeclaration{
\chapter{Declarations}%
\section*{Originality}%
This work contains no material which has been accepted for the award of any other degree of diploma in any university or other tertiary institution.
To the best of my knowledge and belief, this work contains no material previously published or written by another person, except where due reference has been made in the text.

\section*{Permissions}%
I give consent to this copy of my thesis, when deposited in the University Library, being made available for loan and photocopying, subject to the provisions of the Copyright Act 1968.

I also give permission for the digital version of my thesis to be made available on the web, via the University's digital research repository, the Library catalogue, the Australasian Digital Theses Program (ADTP) and also through web search engines, unless permission has been granted by the University to restrict access for a period of time.
\\\vspace{20mm}\\
\makeatletter\@author\makeatother
}

%% 
%% Copyright (C) 2011 by Will Robertson & Zebb Prime
%% 
%% will.robertson@latex-project.org
%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status)
%% by Will Robertson.
%% 
%% This work consists of the file  adelaide-mecheng-thesis.dtx
%% with assorted derived files.
%% 
%%
%% End of file `adelaide-mecheng-thesis.cls'.
