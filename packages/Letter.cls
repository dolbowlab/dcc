\ProvidesClass{Letter}[2019/07/21, v1.0]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\ExecuteOptions{}
\ProcessOptions\relax
\if@singlespace
  \LoadClass[singlespace]{Report}
\fi
\if@onehalfspace
  \LoadClass[onehalfspace]{Report}
\fi
\if@doublespace
  \LoadClass[doublespace]{Report}
\fi

\pagenumbering{gobble}
\pagestyle{plain}
