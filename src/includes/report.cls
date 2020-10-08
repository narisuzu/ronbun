\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{includes/report}[2020/10/07 my report class]

\LoadClass[a4paper, 10ptj]{ltjsreport}
\RequirePackage{includes/mathandphy}

\newcommand*{\import}[2]{
    \noindent \textbf{\luaexec{
        dofile("includes/lua/subject.lua")
        tex.sprint(subject_table.#1)
    }}
    \ \luaexec{
        tex.sprint(string.upper("#2"))
    } \hfill Homework \#\\
    Satanya@張睿 (\today)
    
    \noindent\hrulefill
    
    \luaexec{
        dofile("includes/lua/tools.lua")
        input_fill("problems/#1/#2")
    }
}
