$lualatex = "lualatex -synctex=1 -file-line-error --halt-on-error -interaction=nonstopmode --shell-escape %O %S";
$pdf_mode = 4;
$bibtex_use = 2;
$preview_mode = 1;
$recorder = 1;
$pdf_previewer = 'start "C:\Users\satanya\AppData\Local\SumatraPDF\SumatraPDF.exe" %O %S';
$aux_dir = ".aux";
$out_dir = "build";
$clean_ext = "synctex.gz acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi xdv";