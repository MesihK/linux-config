ROOT_FILE 		= pdr
BACKUP_FILES 	= *~
CLEAN_FILES 	= $(BACKUP_FILES) *-frn.tex *.fls *.acn *.acr *.alg *.aux *.bcf *.bbl *.blg *.dvi *.fdb_latexmk *.glg *.glo *.gls *.idx *.ilg *.ind *.ist *.lof *.log *.lot *.lol *.maf *.mtc *.mtc0 *.nav *.nlo *.out *.pdfsync *.ps *.snm *.synctex.gz *.toc *.vrb *.xdy *.tdo *.run.xml *-blx.bib
DIST_FILES 		= $(ROOT_FILE).pdf 

.PHONY: clean distclean tex 

tex: 
	latexmk -silent -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $(ROOT_FILE).tex

clean:
	echo $(CLEAN_FILES) | xargs $(RM); \
	find . -name '$(BACKUP_FILES)' | xargs $(RM);

distclean: clean
	$(RM) $(DIST_FILES)


