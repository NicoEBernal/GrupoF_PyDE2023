% CLASE DE LATEX DEL TRABAJO ESCRITO
% ------------------------------------

% Declaraciones iniciales
% -----------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proyectoelectronico}[2016/01/31 Informe del Proyecto Eléctrico de Ingeniería Eléctrica - UCR]

% Opciones de la clase
% --------------------

% Documento tipo borrador
\newif\ifborrador
\DeclareOption{borrador}{\borradortrue}

% Documento tipo ebook
\newif\ifebook
\DeclareOption{ebook}{\ebooktrue}

% Documento versión final
\newif\iffinal
\DeclareOption{final}{\finaltrue}

\ifebook
 	\PassOptionsToClass{17pt}{memoir}
\else
  	\PassOptionsToClass{11pt}{memoir}
\fi

% Cualquier otra opción se pasa a 'memoir'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

% Procesar las opciones
\ProcessOptions\relax

% Cargar la clase base ('memoir')
% -------------------------------

\LoadClass[a4paper,twoside]{memoir}

% Paquetes requeridos
% -------------------

% General
\RequirePackage[english,spanish,es-noindentfirst,es-nolists,es-noquoting]{babel}
	\addto\captionsspanish{\renewcommand{\tablename}{Tabla}}	
	\addto\captionsspanish{\renewcommand{\listtablename}{\'{I}ndice de tablas}}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[calc,english]{datetime2}
\RequirePackage{xparse}
\RequirePackage[intoc,spanish]{nomencl}
	\makenomenclature

% Matemática
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}

% colores
\RequirePackage[dvipsnames]{xcolor}

% Gráficas y figuras
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage[lofdepth,lotdepth]{subfig}
\RequirePackage{tikz}
%\RequirePackage{pgfplots}      % saqué estos dos porque me tira un error al compilar
%	\pgfplotsset{compat=1.14}   % quizás haya que agregarlo nuevamente si lo necesitamos, pero dudo que lo usemos
\RequirePackage[american]{circuitikz}
\RequirePackage{multirow}
\usepackage{verbatimbox}
\RequirePackage{longtable}

\usepackage{newfloat}
\DeclareFloatingEnvironment[
    fileext=los,
    listname={Índice de fotografías},
    name=Fotografía,
    placement=tbhp,
    within=chapter,
]{foto}

\usepackage{listings}
\input{codigo/definicion_de_ASM} % en este archivo está la definición para el estilo de texto en asembler del CDP1802
\renewcommand{\lstlistingname}{Listado} % esto es para que en lugar de decir Listing en inglés, lo diga en español: Listado
\renewcommand{\lstlistlistingname}{Índice de listados}

% Estilo
\RequirePackage{siunitx}
\RequirePackage[colorlinks=true,urlcolor=blue,linkcolor=black,citecolor=blue]{hyperref}
	\urlstyle{same}
\RequirePackage{float}
\RequirePackage{multicol}
\RequirePackage[leftcaption]{sidecap}
	\sidecaptionvpos{figure}{t}
\RequirePackage{enumitem}

% Bibliografía
\RequirePackage[backend=biber, style=ieee]{biblatex}
    \addbibresource{bibliografia/bibliografia.bib}
\RequirePackage{csquotes}

% Estilo del encabezado y pie de página
\createmark{chapter}{both}{shownumber}{}{. \ }
\nouppercaseheads
\spanishlcroman

% Otros ajustes
\setsecnumdepth{subsection}
\settocdepth{subsection}
\setfloatadjustment{figure}{\centering}
\setfloatadjustment{table}{\centering}

% Nuevos comandos especiales
% --------------------------

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcommand{\clearthepage}{\iffinal \cleardoublepage \else \clearpage \fi}

% Formato de la página y área de escritura
% ----------------------------------------

% Versión por defecto (igual a final)
\settypeblocksize{20cm}{16cm}{*}
\setbinding{1.5cm}
\setulmargins{*}{*}{1}
\setlrmargins{*}{*}{1}
\checkandfixthelayout

% Versión final
\iffinal
	\settypeblocksize{20cm}{16cm}{*}
	\setbinding{1.5cm}
	\setulmargins{*}{*}{1}
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
\fi

% Versión borrador
\ifborrador
	\settypeblocksize{22cm}{16cm}{*}
	\setbinding{0cm}
	\setulmargins{*}{*}{1}
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\DoubleSpacing
	\openany
\fi

% Versión eBook
\ifebook
	\usepackage[paperwidth=9cm, 
    			paperheight=11.5cm, 
                top=0.1cm, left=0.1cm, 
                right=0.1cm, bottom=0.2cm]{geometry}
    \sloppy
\fi

% Textos predefinidos
% -------------------

\newcommand{\UCR}{Universidad Nacional de Misiones}
\newcommand{\FI}{Facultad de Ingeniería}
\newcommand{\EIE}{Escuela de Ingeniería Eléctrica}
\newcommand{\PE}{Proyecto y Diseño Electrónico}
\newcommand{\codigoMateria}{ET546}
\newcommand{\por}{Desarrollado por}
\newcommand{\lugar}{Oberá, Misiones}
\newcommand{\aprobado}{Aprobado por}
\newcommand{\introguia}{Profesor tutor}
\newcommand{\introlectorA}{Profesor lector}
\newcommand{\introlectorB}{Profesor lector}

% Definición de datos globales del proyecto
% -----------------------------------------

\def\titulo#1{\gdef\@titulo{#1}}

\def\autoruno#1{\gdef\@autoruno{#1}}
\def\carneuno#1{\gdef\@carneuno{#1}}
\def\emailuno#1{\gdef\@emailuno{#1}}

\def\autordos#1{\gdef\@autordos{#1}}
\def\carnedos#1{\gdef\@carnedos{#1}}
\def\emaildos#1{\gdef\@emaildos{#1}}

\def\autortres#1{\gdef\@autortres{#1}}
\def\carnetres#1{\gdef\@carnetres{#1}}
\def\emailtres#1{\gdef\@emailtres{#1}}

\def\guia#1{\gdef\@guia{#1}}
\def\lectorA#1{\gdef\@lectorA{#1}}
\def\lectorB#1{\gdef\@lectorB{#1}}
\def\fecha#1{\gdef\@fecha{#1}}
\def\mes#1{\gdef\@mes{#1}}
\def\ano#1{\gdef\@ano{#1}}

% 1. Formato de portada
% ---------------------

\newcommand{\portada}{
\thispagestyle{empty}
\pdfbookmark[1]{Portada}{portada}
\begin{center}
    
    {
		\small
		\begin{tabular}{p{9.75cm} r}
			\includegraphics[scale=1.2]{imagenes/imagenes_caratula/izquierda} & \includegraphics[scale=1.2]{imagenes/imagenes_caratula/derecha}
		\end{tabular}
	}
    \par\vspace{1cm}
	{\huge\bfseries\scshape\UCR}
    \vskip 1em
    {\LARGE\bfseries\FI}
    \vskip 2em
    \Large\bfseries Carrera: Ingeniería Electrónica
	\vskip 2em
    \Large\bfseries Asignatura: \PE \hspace{0.1cm} \codigoMateria
	\vskip 2em
    \LARGE\bfseries\@titulo
	\vskip 2em
	\large\normalfont\por
	\vskip 1em
	\large\bfseries \@autoruno \\
	\vskip 0.1em
	\large\bfseries \@emailuno \\
	\vskip 0.8em
	\large\bfseries \@autordos \\
	\vskip 0.1em
	\large\bfseries \@emaildos \\
%	\vskip 0.8em
%	\large\bfseries \@autortres \\
%	\vskip 0.1em
%	\large\bfseries \@emailtres \\
	\vfill
	\large\bfseries\lugar
	\ifebook \vskip 0em \else \vskip 1em \fi
	\large\normalfont\DTMMonthname{\@mes}{ de }\@ano
\end{center}
\clearthepage
}

% 2. Formato de la hoja de aprobación
% -----------------------------------

\newcommand{\aprobacion}{
\newpage
\thispagestyle{empty}
\pdfbookmark[1]{Firmas}{firmas}
\begin{center}
	\vspace*{2em} 
    \LARGE\bfseries\@titulo
	\ifebook \vskip 1em \else \vskip 2em \fi
	\large\normalfont\por
	\ifebook \vskip 0.5em \else \vskip 1em \fi
	\large\bfseries \@autoruno \\
	\vskip 0.1em
	\large\bfseries \@emailuno \\
        \vskip 0.1em
	\large\bfseries \@carneuno \\
	\vskip 0.8em
	\large\bfseries \@autordos \\
	\vskip 0.1em
	\large\bfseries \@emaildos \\
        \vskip 0.1em
	\large\bfseries \@carnedos \\
	\vskip 0.8em
%	\large\bfseries \@autortres \\
%	\vskip 0.1em
%	\large\bfseries \@emailtres \\
%	\vskip 0.1em
%	\large\bfseries \@carnetres \\
	\vfill
	\large\bfseries\PE \hspace{0.1cm} \codigoMateria
	\vskip 0.5em
    \large\normalfont\aprobado
    \ifebook
    	\vskip 1em
        \large\normalfont\@guia 	\\
		\normalsize\itshape\introguia 	\\ 
		\large\normalfont\@lectorA 	\\
        \normalsize\itshape\introlectorA	\\
        \large\normalfont\@lectorB 	\\
		\normalsize\itshape\introlectorB	\\
    \else
		\vskip 4em
        \rule {6cm}{0.1pt} \\
		\large\normalfont\@guia \\
		\large\itshape\introguia
		\vskip 3em
		\begin{tabular}{C{7cm}C{7cm}}
      		\rule {6cm}{0.1pt} 
        	& \rule {6cm}{0.1pt} 
        	\\
			\large\normalfont\@lectorA 
        	& \large\normalfont\@lectorB 
        	\\ 
			\large\itshape\introlectorA 
        	& \large\itshape\introlectorB
		\end{tabular}
    	\vskip 2em
    	\large\normalfont\DTMMonthname{\@mes}{ de }\@ano \\
    \fi
\end{center}
\clearthepage
}

% 3. Formato del resumen
% ----------------------

\NewDocumentEnvironment{resumen}{ m }
{	% Encabezado
	\thispagestyle{empty}
	\pdfbookmark[1]{Resumen}{resumen}
	\begin{center}
		\large\bfseries Resumen
    	\vskip 0em
		\LARGE\bfseries \@titulo
   		\vskip 0.5em
		\large\normalfont\por 
    	\vskip 0.5em
		\large\bfseries\@autoruno
		\vskip 0.3em
		\large\bfseries\@autordos
		\vskip 0.3em
%		\large\bfseries\@autortres
    	\vskip 0.5em
    	\normalfont\UCR\\\FI\\\introguia{: }\@guia \\
        \DTMMonthname{\@mes}{ de }\@ano		
    	\vskip 1em
	\end{center}
}{	% Pie
    \vskip 0.5em
    \noindent{\itshape {\bfseries Palabras claves}: #1.} 
    \vfill
	\noindent\hrulefill \\
	{\footnotesize \textbf{Acerca de \PE} \\ 
	El Proyecto Electrónico es un curso anual bajo la modalidad de trabajo individual o grupal supervisado, con el propósito de aplicar estrategias de diseño y análisis a un problema de temática abierta de la ingeniería electrónica.
	}
	\clearthepage
}

% 4. Formato del abstract
% -----------------------

\NewDocumentEnvironment{theabstract}{ m m }
{	% Encabezado
	\thispagestyle{empty}
	\pdfbookmark[1]{Abstract}{abstract}
	\begin{center}
		\large\bfseries Abstract
    	\vskip 0em
		\LARGE\bfseries #1 
        \vskip 0em
		{\Large\normalfont Translated from the original spanish title: ``\@titulo''}
    	\vskip 0.5em
		{\large\normalfont by}
    	\vskip 0.5em
		\large\bfseries\@autoruno
		\vskip 0.3em
		\large\bfseries\@autordos
		\vskip 0.3em
%		\large\bfseries\@autortres
    	\vskip 0.5em
    	{\normalfont
        National University of Misiones \\
        Engineering Faculty \\
        Tutor: \@guia \\
        \DTMenglishmonthname{\@mes}{ of }\@ano
        }		
        \vskip 1em
	\end{center}    
}{	% Pie
	\vskip 0.5em
	\noindent{\itshape {\bfseries Keywords}: #2.} 
    \vfill
	\noindent\hrulefill \\
	{\footnotesize\textbf{About \PE\ (``Electronic Project'')} \\ 
	 The ``Electronic Project'' is a course of supervised individual or group work of one semester, with the purpose of applying design and analysis strategies to a problem in an open topic in electrical engineering.
	}
	\clearthepage
}

% 5. Formato de los reconocimientos
% ---------------------------------

\NewDocumentEnvironment{reconocimiento}{ m }
{
	\pdfbookmark[1]{Agradecimientos}{agradecimientos}
    \thispagestyle{empty}
    \begin{flushright}
      \itshape
      #1
    \end{flushright}
    \begin{vplace}[0.5]
    \vspace{36mm}
    {\Large\bfseries Agradecimientos}\vspace{1em}
	\setlength\parindent{0pt}
    \end{vplace}
}{	
     
    \clearthepage
}

% I. Formato del título de los capítulos
% -----------------------------------

% Definición de \chapter{ }
\def\@makechapterhead#1{ 
  	\vspace*{5em}  
    {
  	\parindent 0pt \raggedright
    \ifnum \c@secnumdepth >\m@ne     
      	\fontfamily{\sfdefault}\selectfont 
      	\begin{flushright}
        	{\Large \@chapapp{} \thechapter}
      		\par
    		\vspace{2mm} 
   			\fontfamily{\sfdefault}\selectfont 
    		\huge\bfseries%\scshape
    		#1\par
    	\end{flushright}
    	\nobreak                     
        \vspace{10mm}
    \fi                   
  	} 	
}

% Definición de \chapter*{ }
\def\@makeschapterhead#1{
    \vspace*{5em}
  	{ 
    \parindent 0pt \raggedright
    \fontfamily{\sfdefault}\selectfont
    \huge\bfseries
    #1\par
    \nobreak
    \vspace{10mm}
	} 
}

% Estilos de capítulo predefinidos
%\chapterstyle{madsen} 	% (Ver "Various chapter styles for the memoir class" por Lars Madsen).

% II. Formato de las secciones
% ------------------------

% Sección
\setsecheadstyle{\Large\bfseries\fontfamily{\sfdefault}\selectfont}

% Sub-sección
\setsubsecheadstyle{\large\bfseries\fontfamily{\sfdefault}\selectfont}

% Sub-sub-sección
\setsubsubsecheadstyle{\normalfont\bfseries\fontfamily{\sfdefault}\selectfont}

% Párrafo
\setparaheadstyle{\normalfont\bfseries\fontfamily{\sfdefault}\selectfont}

% Sub-párrafo
\setsubparaheadstyle{\normalfont\bfseries\fontfamily{\sfdefault}\selectfont}

%%%%%%%%%
\endinput
%%%%%%%%%
