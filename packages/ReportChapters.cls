\ProvidesClass{Report}[2019/08/27, v1.1]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass[12pt]{report}
\RequirePackage{General}
\RequirePackage[letterpaper,margin=1in]{geometry}
\if@singlespace
\fi
\if@onehalfspace
  \onehalfspacing
\fi
\if@doublespace
  \doublespacing
\fi

% Title page
\RequirePackage[explicit]{titlesec} % gives access to \theauthor etc.
\RequirePackage[blocks]{authblk}                % Adds author name and affil
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}

%Header styles
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\begin{tabular}{@{}c}\\ ~\end{tabular}}
\fancyhead[L]{\theauthor}
\fancyhead[R]{\course}
\fancyfoot[C]{\begin{tabular}{@{}c}\thepage \\ ~\end{tabular}}
\renewcommand{\footrulewidth}{0pt}

%Figure styles

%Formatting text around equations
\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%Formatting lists
\RequirePackage{enumitem}
% list item formatting types
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}
