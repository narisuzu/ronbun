\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hautart}[2020/10/07 my article class]

\LoadClass[zihao = -4, linespread = 1.5, a4paper, oneside]{ctexart}
\RequirePackage{mathandphy}
\RequirePackage{fancyhdr}
\pagestyle{plain}

\RequirePackage{leading}
\newcommand{\twolines}{\vspace*{35.5pt}}
\newcommand{\oneline}{\vspace*{24pt}}
\newcommand{\halfline}{\vspace*{9pt}}


\RequirePackage{tocloft}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftbeforesecskip}{0pt}
\renewcommand{\cftbeforesubsecskip}{0pt}
\renewcommand{\cftaftertoctitleskip}{2.0\baselineskip}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\cftsetindents{section}{0em}{2em}
\cftsetindents{subsection}{0em}{2em}

\RequirePackage{abstract}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}

\setCJKfamilyfont{hyfsc}{HYCuFangSongJ}             %使用STXingkai华文行楷字体
\newcommand{\fangsongbd}{\CJKfamily{hyfsc}}

\setCJKfamilyfont{csong}{STZhongSong}             %使用STXingkai华文行楷字体
\newcommand{\csong}{\CJKfamily{csong}}


%行距設定
\RequirePackage{geometry}
\geometry{left=3.2cm, right=2.5cm, top=2.5cm, bottom=2.5cm}

\ctexset{
    abstractname = {\large{摘\quad 要}},
    bibname = {\large\heiti\centerline{参\ 考\ 文\ 献}\halfline},
    contentsname = {\large\centerline{目\quad 次}}, 
    tocdepth = 2,
    section = {
        format = \large\bfseries\sffamily
    },
    subsection = {
        format = \zihao{4}\bfseries\sffamily
    },
    subsubsection = {
        format = \normalsize\sffamily
    },
    paragraph = {
      indent = \parindent,
      name = {(,)},
      number = \arabic{paragraph},
      format = \normalsize,
      beforeskip = 0ex,
      afterskip = 0em
    },
    appendix = {
      number = 附录\Alph{section}
    }
}

% ---------- 载入学校logo ----------
\newcommand{\logopic}{
  \hspace*{-0.9cm}\includegraphics[width=1.75cm]{assets/logo.png}\quad
  \includegraphics[width=5cm]{assets/logoname.png}
}

\RequirePackage{pgfkeys}
\RequirePackage{xparse}
\pgfqkeys{/hautset}{
  title/.store in=\hauttitle,
  author/.store in=\hautauthor,
  gakubu/.store in=\hautgakubu,
  class/.store in=\hautclass,
  stuid/.store in=\hautstuid,
  teacher/.store in=\hautteacher,
  rank/.store in=\hautrank,
  engtitle/.store in=\hautengtitle
}

\NewDocumentCommand\hautset{m} {
  \pgfqkeys{/hautset}{#1}
  \title{\hauttitle}
}

%------标题界面-----------%
\renewcommand{\maketitle}[1][7.5em]{
	\begin{titlepage}
    \vspace*{-0.65cm}
		\logopic
    \vspace{48pt}
    \begin{center}
			{\fontsize{48}{44}\selectfont\fangsongbd
      2021届毕业生\\ %\bfseries
      \ziju{0.235}毕业设计说明书\\} %\bfseries
      
      \vspace{92pt}

      { \renewcommand{\arraystretch}{1.7}
        \setlength\tabcolsep{0pt}
        \large\csong
        \begin{tabular}{lc@{\hspace{1em}}lc}
          \makebox[5em][c]{题 \hfill 目：} &
          \multicolumn{3}{c}{
					  \underline{\makebox[318pt]{\hauttitle}} 
          }

          \vspace{40pt}

          \\\\

					\makebox{院系名称：} & 
					\underline{\makebox[#1]{\hautgakubu}} &

					\makebox{专业班级：} & 
					\underline{\makebox[#1]{\hautclass}} \\

					\makebox{学生姓名：} & 
					\underline{\makebox[#1]{\hautauthor}} &

					\makebox[5em][c]{学 \hfill 号：} & 
					\underline{\makebox[#1]{\hautstuid}} \\

					\makebox{指导教师：} &
					\underline{\makebox[#1]{\hautteacher}} &

					\makebox{教师职称：} &
					\underline{\makebox[#1]{\hautrank}} \\
			  \end{tabular}
        \\
        \renewcommand{\arraystretch}{1}
        \vspace{60pt}
        \@date
      }\\

        
		\end{center}
	\end{titlepage}
}

\RequirePackage{makecell}
\RequirePackage{threeparttable}

\RequirePackage{caption}
\captionsetup{font={small}} 

\setcounter{secnumdepth}{5}
% \renewcommand\theparagraph{\indent\normalfont(\arabic{paragraph})}
% \newcommand\PARA{\paragraph{}}


\numberwithin{figure}{section}
\numberwithin{table}{section}

\RequirePackage{enumerate}
\RequirePackage{gbt7714}

%谢谢
\newenvironment{keturon}
               {\newpage\twolines\section*{\centerline{\heiti 结\quad 论}\oneline}}
               {\addcontentsline{toc}{section}{结论}}

\newenvironment{arigatou}
               {\newpage\twolines\section*{\centerline{\heiti 致\quad 谢}\oneline}}
               {\addcontentsline{toc}{section}{致谢}}

\RequirePackage{hologo}

