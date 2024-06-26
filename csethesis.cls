\ProvidesClass{csethesis}
\LoadClass[twoside,openright,UTF8,cs4size,a4paper]{ctexbook}%要求从目录页双面，默认twoside

\RequirePackage{pdfpages}%插入pdf文档

% http://aao.neu.edu.cn/2018/1112/c2570a42991/pagem.htm 毕业设计要求
% --------字体设置-------%
\RequirePackage{times}
\setmainfont{Times New Roman}%西文字体
\songti
% 字体大小：\zihao{x} x: 4表示四号 -4表示小四，以此类推

\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\newenvironment{jc}{\fontfamily{zhsong}\selectfont}

% --------行距---------%
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.5} %\normalsize %1.5倍行距

% --------章节设置-------%

%\ctexset { 
%  chapter = {  
%    name={}, 
%    number={\arabic { chapter } }, 
%    format={\centering \heiti \zihao {-2}},
%    aftername={\quad }, beforeskip={-5ex}, afterskip={1.0ex}
% },
%  section = {
%    format = {\Large},
%    nameformat+={\zihao{4}},
%    aftername={\ },
%    titleformat={\zihao{4}\heiti},
%    beforeskip={1.0ex},
%    afterskip={1.0ex}
%  },
%  subsection = {
%    format={\Large\bfseries},
%    nameformat+={\zihao{-4}},
%    aftername={\ },
%    titleformat={\zihao{-4}\heiti},
%    beforeskip={1.0ex},
%    afterskip={1.0ex}
%  }
%}

\CTEXsetup[
name={},                   % 默认{第,章}
number={\arabic{chapter}},  %章节编号设置为阿拉伯数字格式
format={\centering\heiti\zihao{-2}},  %{\centering\zihao{-3}\heiti},
% nameformat={},
aftername={\quad},
% titleformat={},
% fixskip = true,
beforeskip={-5ex},
afterskip={1.0ex}
]{chapter}

\CTEXsetup[
format={\Large},   %\bfseries for bold
nameformat+={\zihao{4}},
aftername={\ },
titleformat={\zihao{4}\heiti},
beforeskip={1.0ex},
afterskip={1.0ex}
]{section}%二级标题左对齐

\CTEXsetup[
format={\Large\bfseries},
nameformat+={\zihao{-4}},
aftername={\ },
titleformat={\zihao{-4}\heiti},
beforeskip={1.0ex},
afterskip={1.0ex}
]{subsection}%三级标题左对齐

% ----------段落---------%
\RequirePackage{indentfirst}%首段段首缩进
\setlength{\parindent}{4em}%段落缩进
% \CJKindent  %缩进两个中文字符宽度
\setlength{\parskip}{0em}
% \CTEXsetup[
%   parskip={0pt}
% ]{paragraph}

% ----------页面设置----------%
\RequirePackage{geometry} % 调整页面式样
\geometry{
  left=30mm,
  right=25mm,
  top=25mm,
  bottom=25mm,
  headheight=7mm,
  headsep=7mm,
  % textheight=253mm,
  % textwidth=155mm,
  footskip=7mm,
  hmarginratio={2:3}}

% ---------页眉、页脚、脚注设定------%
\RequirePackage{fancyhdr}%页眉页脚宏包
\renewcommand{\headrulewidth}{0.4pt}%页眉线宽
\renewcommand{\footrulewidth}{0pt}%页脚线宽

% 默认页面页眉页脚样式
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}-\ \thepage\ -}% 页码位于页脚居中

  % 左右两栏页眉，左为"东北大学本科毕业设计（论文）" 右为当前章
  \fancyhead[L]{\songti\zihao{5}东北大学本科毕业设计（论文）} % 要求宋体

  \fancyhead[R]{\songti\zihao{5}  第\thechapter 章  \leftmark } % 适应学校的zz要求

  \ifnum \thechapter=0
  \fancyhead[R]{\songti\zihao{5}目录}
  % \else\thechapter>0
  % \fancyhead[R]{\songti\zihao{5}  第\thechapter 章  \leftmark } % 适应学校的zz要求
  \fi
  
  % \fancyhead[R]{\songti\zihao{5}  \leftmark}  

}
\pagestyle{plain}

\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
% \renewcommand{\sectionmark}[1]{ \markright{#1}{} }


% 采用带圈数字符号代替*号脚注
\xeCJKsetcharclass{`①}{`⑩}{1}

% 用法：一定是在章节的标题下面(不能在标题上面）\thispagestyle{task}(也不能是\pagesyle命令)

\fancypagestyle{contents}{
  % \pagenumbering{Roman}
  \fancyhead[L]{\songti\zihao{5}东北大学本科毕业设计（论文）}
  \fancyhead[R]{\songti\zihao{5}目录}
}
\fancypagestyle{cabstract}{
  \fancyhead[L]{\songti\zihao{5}东北大学本科毕业设计（论文）}
  \fancyhead[R]{\songti\zihao{5}摘要}
}
\fancypagestyle{eabstract}{
  \fancyhead[L]{\songti\zihao{5}东北大学本科毕业设计（论文）}
  \fancyhead[R]{\songti\zihao{5}ABSTRACT}
}
\fancypagestyle{listoffiguretable}{\fancyhead[R]{\songti\zihao{5}插图与表格目录}}


% ------------------------ 双面打印 页眉与页脚设置-------------------------%
% 双面打印时，全空的左页可以保留页眉与页脚，也可以不保留，下面的控制中，只能保留一个。

% 首页右开的时候，全空的左页  不保留页眉 与 页脚
\makeatletter
\let\neu@cleardoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{
  \clearpage{\pagestyle{empty}
    \neu@cleardoublepage}}

% % 首页右开的时候，全空的左页 保留页脚 不保留页眉
% \makeatletter
% \let\neu@cleardoublepage\cleardoublepage
% \renewcommand{\cleardoublepage}{
%   \clearpage{
%     \fancyhf{}% Clear header/footer 
%     \renewcommand{\headrulewidth}{0pt}%页眉线宽
%     \fancyfoot[EC]{\zihao{5}-\ \thepage\ -}% 页码位于页脚居中
%     \neu@cleardoublepage}}

% % 首页右开的时候，全空的左页  保留页眉 与 页脚
% \makeatletter
% \let\neu@cleardoublepage\cleardoublepage
% \renewcommand{\cleardoublepage}{
%   \clearpage{\pagestyle{fancy}
%   \neu@cleardoublepage}}


% ------------摘要-----------%
\newenvironment{cabstract}{
  \setcounter{page}{2}
  \setcounter{secnumdepth}{-1}
  \chapter*{\renewcommand{\baselinestretch}{1.5}\normalsize
    {\zihao{-2}{摘 \hspace{0.5em}\hspace{0.5em} 要}}}
  \addcontentsline{toc}{chapter}{摘要}
  \songti\zihao{-4}
  \thispagestyle{cabstract}
  \begin{spacing}{1.5}%1.5倍行距

  }
  {\end{spacing}
  \setcounter{secnumdepth}{3}}

\def\ckeywords#1{
  \vskip 0.5cm
  \noindent\heiti\zihao{-4}{关键词:}\quad\songti\zihao{-4}#1
  % \setcounter{page}{3}
}

\newenvironment{eabstract}{
  % \setcounter{page}{5}
  \setcounter{secnumdepth}{-1}
  \chapter*{\renewcommand{\baselinestretch}{1.5}\normalsize
    {\zihao{-2}\textbf{ABSTRACT}}}
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \thispagestyle{eabstract}
  \pagestyle{contents}
}%开始部分定义
{\setcounter{secnumdepth}{3}}%结束部分定义

\def\ekeywords#1{
  \vskip 0.5cm
  \noindent\zihao{-4}\textbf{Keywords:}\ \zihao{-4}#1 %学校给的例子里面，keywords是分开的。。。还是第一次见
  \pagestyle{contents}                                  %你们想分开就分开吧，反正我就这样了。。。
}
\makeatother

% ------------致谢------------%
\newenvironment{acknowledge}{
  \setcounter{secnumdepth}{-2}
  \chapter{致谢}
}%开始部分定义
{\setcounter{secnumdepth}{3}    
  \clearpage
  \phantom{s}
  \thispagestyle{empty}
}%结束部分定义

% ------------目录------------%
\ctexset { contentsname={目 \hspace{0.5em}\hspace{0.5em} 录} } 
%\CTEXoptions[contentsname={目 \qquad 录}]
\RequirePackage[titles,subfigure]{tocloft}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1}%点间距
\renewcommand{\cftchapdotsep}{\cftdotsep}
% 目录项行距设置
\setlength{\cftbeforechapskip}{0.5ex}
\setlength{\cftbeforesecskip}{0.5ex}
\setlength{\cftbeforesubsecskip}{0.5ex}
% 目录项字体格式
\renewcommand{\cftchapfont}{\zihao{4}\heiti}
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti}
% 目录项缩进
\setlength{\cftchapindent}{0em}
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{1.1em}

\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}

\newcommand{\contents}{
  \pagestyle{contents}          %
  \tableofcontents

  % \ifodd {
  % \clearpage
  % \phantom{s}
  % \thispagestyle{empty}
  % }

  \clearpage
  \pagestyle{plain}
  \pagenumbering{arabic}
  \setcounter{page}{1}%目录页后第一章设置为第一页
}

% ---------数学公式------------%
\RequirePackage{amsmath} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}

\def\insertmath#1{
  \begin{equation}
    % 公式与上下文空白的间距
    % \setlength{\abovedisplayskip}{3pt}
    % \setlength{\belowdisplayskip}{3pt}
    {#1}
  \end{equation}
}

\def\inlinemath#1{
  \begin{math}
    {#1}
  \end{math}
}
  % 引用(\ref)前后可以加上小空格，看起来更合适，\, \; \ 分别为小，中，大空格
\def\myref#1{\,\ref{#1}\,}

% -----------表格---------------%
\RequirePackage{longtable} %长表格
\RequirePackage{booktabs}%三线表
\renewcommand\arraystretch{1.5}
\newcommand{\mytable}[5]{
\begin{table}[htbp]
  \captionnamefont{\heiti\zihao{-4}}
  \centering
  \zihao{5}
  \captionnamefont{\songti\zihao{5}}
  \caption{\songti\zihao{5}#1}
  \label{#2}
  \setlength{\tabcolsep}{5mm}{
  \begin{tabular}{#3}
    \toprule
    #4 \\
    \midrule
    #5
    \bottomrule
  \end{tabular}}
\end{table}
}

% -----------插图---------------%
\RequirePackage{graphicx}
\RequirePackage{epsfig}
\graphicspath{{figures/}}
\RequirePackage{tikz} %画图
\usetikzlibrary{shapes,arrows} %tikz图形库
\RequirePackage{subfigure}
\RequirePackage{float}
\RequirePackage{overpic} %图上标记
% 图形环境中的各种比例参数
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

\def\insertfixpic#1#2#3{
  \begin{figure}[ht]
    % \setcounter{figure}{2} 
    \begin{center}     
      \includegraphics[width=14.5cm]{#1}
      \captionnamefont{\indent\songti\zihao{5}}
      \caption{\songti\zihao{5}{#2}}
      \label{#3}
    \end{center} 
  \end{figure}    
}

\def\insertpic#1#2#3#4{
  \begin{figure}[ht]
    % \setcounter{figure}{2} 
    \begin{center}     
      \includegraphics[#2]{#1}
      \captionnamefont{\indent\songti\zihao{5}}
      \caption{\songti\zihao{5}{#3}}
      \label{#4}
    \end{center}
  \end{figure}  
}

\RequirePackage{ccaption} %中英文题注
\RequirePackage{textcomp} %摄氏度符号
% \RequirePackage{ccmap} %pdf中文复制
\RequirePackage{color} %gnuplot彩色文字
\captiondelim{ }

%-------------引用角标------------%
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}


% ------------代码------------%
\RequirePackage{listings}%代码排版
\usepackage[noend]{algpseudocode}
\usepackage{fontspec}
% \setmonofont{Monaco}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  % basicstyle=\footnotesize,           % the size of the fonts that are used for the code
  basicstyle=\footnotesize\ttfamily,
  numbers=left,                   % where to put the line-numbers
  numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
  % stepnumber=2,                   % the step between two line-numbers. If it's 1, each line 
                                  % will be numbered
  % numbersep=5pt,                  % how far the line-numbers are from the code
  backgroundcolor=\color{white},      % choose the background color. You must add \usepackage{color}
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=shadowbox,                   % adds a frame around the code
  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=b,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  keywordstyle=\color{blue},          % keyword style
  commentstyle=\color{dkgreen},       % comment style
  stringstyle=\color{mauve},         % string literal style
  xleftmargin=2em,xrightmargin=2em, aboveskip=1em,
}

% ------------算法------------%
\RequirePackage{algorithmicx,algorithm}%算法排版
\RequirePackage{amsfonts}
\lstset{language=Mathematica}%这条命令可以让LaTeX排版时将Mathematica键字突出显示
\lstset{extendedchars=false}%这一条命令可以解决代码跨页时，章节标题，页眉等汉字不显示的问题


% --------------参考文献----------%
%\bibliographystyle{unsrt} %参考文献序号按引用顺序排序
%\RequirePackage[
%numbers,
%sort&compress,
%super,
%square]{natbib} %参数代表：数字,排序与压缩,上标，方括号
\bibliographystyle{gbt7714-2005} %参考文献格式设为GBT7714-2005N
\usepackage[numbers,sort&compress]{natbib}
\setlength{\bibsep}{0.5ex}  %缩小参考文献间距

\RequirePackage[
draft=false,
colorlinks=true,
CJKbookmarks=true,
linkcolor=black,
citecolor=black,
urlcolor=black,
hyperindex]{hyperref}%引用链接颜色设置

% ----------------附录------------%
\renewcommand\appendix{\setcounter{secnumdepth}{-2}}%附录以一级标题显示并且不显示编号

% -------------生成无页眉页脚的空白页----------%
% \clearpage
% \phantom{s}
% \thispagestyle{empty}

%--------------列表-------------%
\usepackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setenumerate{label=(\arabic*)}


%----------可跨页算法-------%
\makeatletter
\newenvironment{breakablealgorithm}
  {% \begin{breakablealgorithm}
   \begin{center}
     \refstepcounter{algorithm}% New algorithm
     \hrule height.8pt depth0pt \kern2pt% \@fs@pre for \@fs@ruled
     \renewcommand{\caption}[2][\relax]{% Make a new \caption
       {\raggedright\textbf{\ALG@name~\thealgorithm} ##2\par}%
       \ifx\relax##1\relax % #1 is \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
       \else % #1 is not \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
       \fi
       \kern2pt\hrule\kern2pt
     }
  }{% \end{breakablealgorithm}
     \kern2pt\hrule\relax% \@fs@post for \@fs@ruled
   \end{center}
  }
\makeatother
