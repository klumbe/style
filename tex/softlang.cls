%*******************************************************************************
%  softlang.cls
%
%  Latex template by the
%  workgroup Software Languages
%
%  Thanks to Detlev Droege and Matthias Biedermann
%
%  adapted by
%  templateSE.cls 2006-03-28  v1.0  Philipp Schaer (first version)
%  cgSA.cls 2006-01-17  v1.2  M. Biedermann (new FB4-layout for SA)
%  2007-06-06 Thomas Lempa (FB4-layout for SA and DA)
%  2007-12-21 Michael T. Boos (extension for project internship)
%  2007-12-21 Michael T. Boos UTF8 changed to latin1
%  2008-05-14 Nico Jahn (FB-4 Layout for scripts, seminar works and DA, SA, BA, MA revised)
%  2012-10-30 Michael Ruster back to UTF8, use of hyphens in unknown words put together from two known
%  2015-12-25 Matthias Paul (Expanded for the Software Languages Team)
%  2017-10-20 Christian Müller (Enabled to switch to English)
%
%*******************************************************************************

%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{softlang}[2015/12/25 v1.3]

%--- Initial code --------------------------------------------------------------

\RequirePackage{ifthen}
\newboolean{@isScr}
\newboolean{@isSem}
\newboolean{@isProSem}
\newboolean{@isPP}
\newboolean{@isSW}
\newboolean{@isDT}
\newboolean{@isBT}
\newboolean{@isMT}
\newboolean{@isFemale}
\newboolean{@isTimes}
\newboolean{@isPalatino}
\newboolean{@isExtern}
\newboolean{@isSingle}
\newboolean{@isOneHalf}
\newboolean{@isDouble}
\newboolean{@isEnglish}

%--- Declaration of options ----------------------------------------------------

\DeclareOption{scr}{\setboolean{@isScr}{true}}
\DeclareOption{sem}{\setboolean{@isSem}{true}}
\DeclareOption{prosem}{\setboolean{@isProSem}{true}}
\DeclareOption{pp}{\setboolean{@isPP}{true}}
\DeclareOption{sa}{\setboolean{@isSW}{true}}
\DeclareOption{diplom}{\setboolean{@isDT}{true}}
\DeclareOption{msc}{\setboolean{@isMT}{true}}
\DeclareOption{bsc}{\setboolean{@isBT}{true}}
\DeclareOption{w}{\setboolean{@isFemale}{true}}
\DeclareOption{m}{\setboolean{@isFemale}{false}}
\DeclareOption{times}{\setboolean{@isTimes}{true}}
\DeclareOption{palatino}{\setboolean{@isPalatino}{true}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside,openright}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{extern}{\setboolean{@isExtern}{true}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{single}{\setboolean{@isSingle}{true}}
\DeclareOption{onehalf}{\setboolean{@isOneHalf}{true}}
\DeclareOption{double}{\setboolean{@isDouble}{true}}
\DeclareOption{de}{\setboolean{@isEnglish}{false}}
\DeclareOption{en}{\setboolean{@isEnglish}{true}}

%--- Execution of options ------------------------------------------------------

\ProcessOptions

%--- Package loading -----------------------------------------------------------

\LoadClass[a4paper,titlepage]{book}
\RequirePackage[ngerman,english]{babel}               % Support new German spelling
\RequirePackage[T1]{fontenc}                          % Syllable separation also for words with umlauts
\RequirePackage[utf8]{inputenc}                       % Support of umlauts and special characters
\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}  % Silby separation in unknown composite words
\RequirePackage{csquotes}                      
\RequirePackage{graphicx}                             % For the integration of graphics
\RequirePackage{graphics}                             % For the integration of graphics
\RequirePackage{tabularx}                             % Flexible design of tables
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{color}                                % Support of colors
\RequirePackage{setspace}                             % Change line spacing
\RequirePackage{fancyhdr}                             % Fancy headers
\RequirePackage[colorlinks=true,linkcolor=black, citecolor = black,pdfpagemode = none,urlcolor=blue,pdfstartview=FitH,pdfhighlight={/P}]{hyperref}
% \RequirePackage{bibgerm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default: Computer Modern (TeX-Standard)

\ifthenelse{\boolean{@isTimes}}{%
  \RequirePackage{times}                        % Font Times New Roman
}{}

\ifthenelse{\boolean{@isPalatino}}{%
  \RequirePackage{palatino}                     % Font Book Antiqua/Palatino
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--- Code ----------------------------------------------------------------------

\renewcommand{\contentsname}{T\lowercase{able of} C\lowercase{ontents}}

\def\@courseofstudies{}
\newcommand{\courseofstudies}[1]{\def\@courseofstudies{#1}}

\def\@lecturerName{}
\newcommand{\lecturerName}[1]{\def\@lecturerName{#1}}

\def\@lecturerInfo{}
\newcommand{\lecturerInfo}[1]{\def\@lecturerInfo{#1}}

\def\@primarysupervisorName{}
\newcommand{\primarysupervisorName}[1]{\def\@primarysupervisorName{#1}}

\def\@primarysupervisorInfo{}
\newcommand{\primarysupervisorInfo}[1]{\def\@primarysupervisorInfo{#1}}

\def\@secondarysupervisorName{}
\newcommand{\secondarysupervisorName}[1]{\def\@secondarysupervisorName{#1}}

\def\@secondarysupervisorInfo{}
\newcommand{\secondarysupervisorInfo}[1]{\def\@secondarysupervisorInfo{#1}}

\def\@tertiarysupervisorName{}
\newcommand{\tertiarysupervisorName}[1]{\def\@tertiarysupervisorName{#1}}

\def\@tertiarysupervisorInfo{}
\newcommand{\tertiarysupervisorInfo}[1]{\def\@tertiarysupervisorInfo{#1}}

\newcommand{\submission}{%
  \if@isEnglish
	\ifcase\month
	\or January
	\or February
	\or March
	\or April
	\or May
	\or June
	\or July
	\or August
	\or September
	\or October
	\or November
	\or December
	\fi
  \else
	  \ifcase\month\or Januar\or Februar\or M{\"a}rz\or April\or Mai\or Juni\or
	  Juli\or August\or September\or Oktober\or November\or Dezember \fi
  \fi
  \number \year
}

%%% Set variables based on language %%%
\if@isEnglish
	\newcommand{\seminarwork}{Seminar work}
	\newcommand{\proseminarpaper}{Proseminar paper}
	\newcommand{\researchpaper}{Research paper}
	\newcommand{\projectpractical}{Project practical}
	\newcommand{\diplomathesis}{Diploma thesis}
	\newcommand{\obtain}{in order to optain a degree of }
	\newcommand{\ainformatikerin}{a Diplom-Informatikerin}
	\newcommand{\ainformatiker}{a Diplom-Informatiker}
	\newcommand{\bachelorthesis}{Bachelor thesis}
	\newcommand{\abachelor}{a Bachelor of Science}
	\newcommand{\masterthesis}{Master thesis}
	\newcommand{\amaster}{a Master of Science}
	\newcommand{\incourseofstudies}{in the course of studies }
	\newcommand{\submittedby}{submitted by}
	\newcommand{\lecturer}{Lecturer}
	\newcommand{\supervisor}{Supervisor}
	\newcommand{\supervisorexpert}{Supervisor}
	\newcommand{\primarysupervisor}{Primary supervisor}
	\newcommand{\secondarysupervisor}{Secondary supervisor}
	\newcommand{\tertiarysupervisor}{Tertiary supervisor}
	\newcommand{\inX}{in }
	\newcommand{\declaration}{Declaration}
	\newcommand{\declarationtext}{I hereby confirm that the present work has been authored by myself, 
			no other means than those indicated - in particular none in the source list nunnamed internet sources - 
			have been used and that the work or mine hasn't been used in any other examination procedure before.
			The submitted written version corresponds to the electronic version (PDF).
	}
	\newcommand{\library}{I agree this paper to be listed in the library.}
	\newcommand{\internet}{I agree with the publication of this paper on the Internet.}
	\newcommand{\placedate}{Place, date}
	\newcommand{\yes}{Yes}
	\newcommand{\no}{No}
\else
	\newcommand{\seminarwork}{Seminararbeit}
	\newcommand{\proseminarpaper}{Proseminararbeit}
	\newcommand{\researchpaper}{Studienarbeit}
	\newcommand{\projectpractical}{Projektpraktikum}
	\newcommand{\diplomathesis}{Diplomarbeit}
	\newcommand{\obtain}{zur Erlangung des Grades }
	\newcommand{\ainformatikerin}{einer Diplom-Informatikerin}
	\newcommand{\ainformatiker}{eines Diplom-Informatikers}
	\newcommand{\bachelorthesis}{Bachelorarbeit}
	\newcommand{\abachelor}{eines Bachelor of Science}
	\newcommand{\masterthesis}{Masterarbeit}
	\newcommand{\amaster}{eines Master of Science}
	\newcommand{\incourseofstudies}{im Studiengang }
	\newcommand{\submittedby}{vorgelegt von}
	\newcommand{\lecturer}{Dozent}
	\newcommand{\supervisor}{Betreuer}
	\newcommand{\supervisorexpert}{Gutachter}
	\newcommand{\primarysupervisor}{Erstgutachter}
	\newcommand{\secondarysupervisor}{Zweitgutachter}
	\newcommand{\tertiarysupervisor}{Betreuer}
	\newcommand{\inX}{im }
	\newcommand{\declaration}{Erklärung}
	\newcommand{\declarationtext}{Hiermit bestätige ich, dass die vorliegende Arbeit von mir selbständig verfasst wurde und ich
			keine anderen als die angegebenen Hilfsmittel – insbesondere keine im Quellenverzeichnis
			nicht benannten Internet–Quellen – benutzt habe und die Arbeit von mir vorher nicht in einem
			anderen Prüfungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung
			entspricht der elektronischen Variante (PDF).
	}
	\newcommand{\library}{Mit der Einstellung der Arbeit in die Bibliothek bin ich einverstanden.}
	\newcommand{\internet}{Der Veröffentlichung dieser Arbeit im Internet stimme ich zu.}
	\newcommand{\placedate}{Ort, Datum}
	\newcommand{\yes}{Ja}
	\newcommand{\no}{Nein}
\fi

%%% save original offsets

\newlength{\voffsetBackup} \setlength{\voffsetBackup}{\voffset}

\newlength{\hoffsetBackup} \setlength{\hoffsetBackup}{\hoffset}

%%% preserve backslash (conflict with using \raggedleft

\newcommand{\PBS}[1]{\let\temp=\\#1\let\\=\temp}

%%% new titlepage
\renewcommand{\maketitle}{

%%%  Titelpage  %%%
 \setlength{\voffset}{-.5in}
% \setlength{\hoffset}{+.25in}
 \begin{titlepage}
    % Logo Uni
		\noindent\includegraphics[height=1.2cm]{logos/UniLogo}
		\hfill

		\normalsize \vspace*{1.5cm}

    \begin{center}
      \doublespacing
      {\huge\bfseries\@title}\\[1.25cm]
      \singlespacing

      \ifthenelse{\boolean{@isScr}}{
        \huge Skript\\[.2cm]}

	  \ifthenelse{\boolean{@isSem}}{
		\huge \seminarwork\\.[2cm]
	  }
	  
	  \ifthenelse{\boolean{@isProSem}}{
		\huge \proseminarpaper\\[.2cm]
	  }

      \ifthenelse{\boolean{@isSW}}{
		\huge \researchpaper\\[.2cm]
	  }

      \ifthenelse{\boolean{@isPP}}{
		\huge \projectpractical\\[.2cm]
	  }

      \ifthenelse{\boolean{@isDT}}{%
		  \huge \diplomathesis\\[.2cm]
		  \normalsize \obtain~%
		  \ifthenelse{\boolean{@isFemale}}{%
            \ainformatikerin\\}{%
            \ainformatiker\\}
	  }

      \ifthenelse{\boolean{@isBT}}{
		  \huge \bachelorthesis\\[.2cm]
		  \normalsize \obtain \abachelor\\
	  }

      \ifthenelse{\boolean{@isMT}}{
		  \huge \masterthesis\\[.2cm]
		  \normalsize \obtain \amaster\\
	  }

      \ifthenelse{\equal{\@courseofstudies}{}}{}{
		\normalsize \incourseofstudies \@courseofstudies \\[.75cm]
	  }

	  \normalsize \submittedby\\[1ex]\Large\@author \\[2.3cm]
    \end{center}

      \normalsize {

      \ifthenelse{\boolean{@isScr}}{
        	\begin{tabularx}{\linewidth}{l X}
				\lecturer :
						  & \@lecturerName \\
						  & \@lecturerInfo \\[.2cm]
			\end{tabularx}\\[2cm]}{

        \ifthenelse{\boolean{@isProSem}\or\boolean{@isSem}\or\boolean{@isSW}\or\boolean{@isPP}}{%
          %% if isSA or isPP or isSem
          \begin{tabularx}{\linewidth}{l X}
				\supervisor :
						  & \@primarysupervisorName \\
                          & \@primarysupervisorInfo \\[.2cm]
                          & \@secondarysupervisorName \\
                          & \@secondarysupervisorInfo \\[.2cm]
			\ifthenelse{\NOT\equal{\@tertiarysupervisor}{}}{
						  & \@tertiarysupervisorName \\
                          & \@tertiarysupervisorInfo \\[.2cm]}{}
          \end{tabularx}\\[2cm]}{%
		  
          \begin{tabularx}{1.05\textwidth}{r X} %{ >{\hsize=.24\hsize}X >{\hsize=0.76\hsize}X}
            \ifthenelse{\equal{\@secondarysupervisorName}{}}{
			\supervisorexpert :
										& \@primarysupervisorName \\
										& \@primarysupervisorInfo \\}{
								
            \primarysupervisor :  		& \@primarysupervisorName \\
										& \@primarysupervisorInfo \\[.2cm]
            \secondarysupervisor : 		& \@secondarysupervisorName \\
										& \@secondarysupervisorInfo \\[.2cm]
			\ifthenelse{\NOT\equal{\@tertiarysupervisorName}{}}{
            \tertiarysupervisor :		& \@tertiarysupervisorName \\
										& \@tertiarysupervisorInfo \\[.2cm]}{}
			}
          \end{tabularx}\\[2cm]}}
      }
      \normalsize \hspace*{.12cm} Koblenz, \inX \submission

    \end{titlepage}


    \setlength{\voffset}{\voffsetBackup}
    \setlength{\hoffset}{\hoffsetBackup}


    \cleardoublepage

		\ifthenelse{\boolean{@isBT}\or\boolean{@isMT}\or\boolean{@isDT}}{
			
			\huge
			\textbf{\declaration}
			\normalsize
		    \newline\newline\newline\newline\newline\newline
  		  \thispagestyle{empty}
	    	\noindent
				\declarationtext\\
    		\vspace*{2ex}

    		\begin{flushleft}
      		\begin{tabularx}{\linewidth}{X c c}

        	{} & \yes & \no \\
        	{} & {} & {} \\
        	\library & $\square$ & $\square$ \\
        	{} & {} & {} \\
        	\internet &
        	$\square$ & $\square$

      		\end{tabularx}
    		\end{flushleft}
    		\vspace*{3cm}


    		\small
    		\noindent
    		\dotfill \\
    		{\small(\placedate)}\hfill{\small (\@author)}
		}{}
		
% Different line spacings

\ifthenelse{\boolean{@isSingle}} {
    \singlespacing
  } {
    \ifthenelse{\boolean{@isDouble}} {
      \doublespacing
    } {
      \onehalfspacing
    }
  }
}

\interfootnotelinepenalty=10000