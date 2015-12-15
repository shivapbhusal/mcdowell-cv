\ProvidesClass{mcdowellcv}[2015/12/14 v0.5 McDowell CV class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

% Set font to Calibri
\usepackage{fontspec}
\setmainfont{Calibri}

% Remove paragraph indentation
\usepackage[parfill]{parskip} 

% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array} 

% Required for ifthenelse statements
\usepackage{etoolbox} 

% Suppress page numbers
\pagestyle{empty} 

% Flexible tables
\usepackage{tabu}

% For addmargin comand
\usepackage{scrextend}

% To remove list left margins
\usepackage{enumitem}
\setlist{leftmargin=*, noitemsep, topsep=-4pt}

% ##########
% ##Header##
% ##########

% Address
\makeatletter

\def\address#1{\def\@address{#1}}
\def\@address{}

\def\printaddress{
	\small{\@address}
}

\makeatother

% Name
\makeatletter

\def\name#1{\def\@name{#1}}
\def\@name{}

\def\printname{
	\textsc{\textbf{\LARGE{\@name}}}
}

\makeatother

% Contacts
\makeatletter

\def\contacts#1{\def\@contacts{#1}}
\def\@contacts{}

\def\printcontacts{
	\small{\@contacts}
}

\makeatother

\makeatletter
\def\printheader{
	\begin{center}
		\begin{tabu} to 1\textwidth { X[m,l] X[-1,m,c] X[m,r] }
			\printaddress & \printname & \printcontacts \\
		\end{tabu}	
	\end{center}
	\smallskip
}
\makeatother
% ############################
% ##Sections and Subsections##
% ############################
\makeatletter
\def\printsectionheader#1{
	\vspace*{4.75pt plus 1.5pt minus 1.5pt}
	% Set text margins to equal \tabcolsep (6pt by default)
	\begin{addmargin}[6pt]{6pt}
		\textsc{\textbf{#1}}
	\end{addmargin}
	\smallskip
	\hrule height 0.5pt
	\vspace*{-4pt plus 1.25pt minus 1.25pt}
}
\makeatother

\makeatletter

% Define toggles
\newtoggle{subsecarg1}
\newtoggle{subsecarg2}
\newtoggle{subsecarg3}

\newcommand{\printsubsection}[4]{
	\notblank{#1}{\toggletrue{subsecarg1}}{}
	\notblank{#2}{\toggletrue{subsecarg2}}{}
	\notblank{#3}{\toggletrue{subsecarg3}}{}
	\ifboolexpr{togl {subsecarg1} or togl {subsecarg2} or togl {subsecarg3}}{
		\begin{tabu} to 1\textwidth { X[m,l] X[-1,m,c] X[m,r] }
			\textbf{#1} & \textbf{#2} & \textbf{#3} \\
		\end{tabu}
		\vspace*{-18.5pt plus 6pt minus 6pt}
	}{
		\vspace*{4pt plus 1.25pt minus 1.25pt}
	}
	\togglefalse{subsecarg1}
	\togglefalse{subsecarg2}
	\togglefalse{subsecarg3}
	\begin{addmargin}[9pt]{9pt}
		#4
	\end{addmargin}
	\vspace*{4pt plus 1.25pt minus 1.25pt}
}
\makeatother