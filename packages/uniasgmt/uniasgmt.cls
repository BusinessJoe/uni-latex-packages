\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniasgmt}[2022/03/16 Class for writing answers to uni assignments]


\RequirePackage{xkeyval}

% Assignment info macros
\newcommand{\MyName}{}
\newcommand{\Course}{}
\newcommand{\ProblemSetType}{}
\newcommand{\PSNumber}{}

\newif\ifuniasgmt@course
\newif\ifuniasgmt@asgmtnum

\DeclareOptionX{name}{\renewcommand{\MyName}{#1}}
\DeclareOptionX{course}{\renewcommand{\Course}{#1}\uniasgmt@coursetrue}
\DeclareOptionX{asgmttype}{\renewcommand{\ProblemSetType}{#1}}
\DeclareOptionX{asgmtnum}{\renewcommand{\PSNumber}{#1}\uniasgmt@asgmtnumtrue}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptionsX{
  name=Lukas Boelling,
  asgmttype=Assignment
}

\ProcessOptionsX\relax

\ifuniasgmt@course
\else
  \ClassError{uniasgmt}{option "course" is undefined}
\fi
\ifuniasgmt@asgmtnum
\else
  \ClassError{uniasgmt}{option "asgmtnum" is undefined}
\fi


\LoadClass{article}

% Set margins and improve typesetting
\RequirePackage[margin=1in]{geometry}
\RequirePackage{microtype}

% This package and the following commands set the style of the page headers.
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[L]{\MyName}
\fancyhead[C]{{\Course} {\ProblemSetType} \PSNumber}
\fancyhead[R]{Page \thepage}
\fancyfoot{}
\fancypagestyle{firstpage}{%
  \fancyhf{}
}


% Question stuff
\makeatletter
% hook into LaTeX's enumerate depth
\newcommand{\advancedepth}{\advance\@enumdepth\@ne}
\makeatother

\newcounter{questioncounter}
\setcounter{questioncounter}{1}
\newenvironment{question}{
  \advancedepth%
  \noindent{\textbf{Question \arabic{questioncounter}.}}

  \vspace{1.5em}

}{
  \pagebreak
  \stepcounter{questioncounter}
}

% Make subsections smaller
\RequirePackage{titlesec}
\titleformat*{\subsection}{\normalsize\bfseries}

% Definitions



