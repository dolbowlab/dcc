\ProvidesClass{Presentation}[2019/07/21, v1.0]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[10pt, aspectratio=169]{beamer}
\RequirePackage{General}
\if@singlespace
\fi
\if@onehalfspace
  \onehalfspacing
\fi
\if@doublespace
  \doublespacing
\fi

% theme to use with templates:
\usetheme{Antibes}
\usefonttheme{serif}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{navigation symbols}{%
%	insertslidenavigationsymbol%
%	insertframenavigationsymbol%
%	insertsubsectionnavigationsymbol%
%	insertsectionnavigationsymbol%
%	insertdocnavigationsymbol%
%	insertbackfindforwardnavigationsymbol%
}
\makeatletter
\setbeamertemplate{footline}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.15\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
    \usebeamerfont{title in head/foot}%
    \insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.6\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
    \usebeamerfont{title in head/foot}%
    \insertshortinstitute
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.15\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
    \usebeamerfont{title in head/foot}%
    \insertshortdate
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,right]{institute in head/foot}%
    \usebeamerfont{title in head/foot}
    \insertframenumber{} / \inserttotalframenumber\hspace*{2ex}
  \end{beamercolorbox}}%
}
\makeatother

% section outline formatting
\AtBeginSection[]{\begin{frame}<beamer>\frametitle{}\tableofcontents[currentsection,hideothersubsections]\end{frame}}

% bibliography formatting for beamer
\setbeamertemplate{bibliography item}{\insertbiblabel}
\setbeamercolor*{bibliography entry title}{fg=black}
\setbeamercolor*{bibliography entry author}{fg=black}
\setbeamercolor*{bibliography entry location}{fg=black}
\setbeamercolor*{bibliography entry note}{fg=black}
\setbeamerfont{bibliography item}{size=\footnotesize}
\setbeamerfont{bibliography entry author}{size=\footnotesize}
\setbeamerfont{bibliography entry title}{size=\footnotesize}
\setbeamerfont{bibliography entry location}{size=\footnotesize}
\setbeamerfont{bibliography entry note}{size=\footnotesize}
