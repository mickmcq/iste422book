rerun    = "Rerun to get cross-references right"
basename = book
latex    = xelatex
option   = -jobname $(basename) '\input{preamble-basic.tex}'
texdir   = '/usr/local/texlive/texmf-local/tex/'
pandir   = ~/.pandoc/templates/

all : $(basename).tex
	cp -p preamble-basic.tex $(texdir)
	cp -p titlessectionstoc.tex $(texdir)
	cp -p figuresettings.tex $(texdir)
	cp -p listsettings.tex $(texdir)
	cp -p colorsettings.tex $(texdir)
	cp -p listingssettings.tex $(texdir)
	cp -p tikzsettings.tex $(texdir)
	cp -p fontsettings-fbb.tex $(texdir)
	cp -p widths.tex $(texdir)
	cp -p miscsettings.tex $(texdir)
	cp -p pandocSyntax.tex $(texdir)
	cp -p listings-lstlang4.tex $(texdir)
	$(latex) $(option) || true
	grep -q $(rerun) $(basename).log \
	     && $(latex) $(option) \
	     || true

$(basename).tex : $(basename)-content.md
	cp -p pandocNotes.latex $(pandir)
	pandoc                           \
	  -t latex                       \
	  --bibliography $(basename).bib \
	  --template pandocNotes         \
	     $(basename)-content.md      \
	  -o $(basename).tex

$(basename)-content.md : 0*.md 1*.md
	cat                              \
	  01intro-content.md             \
	  02develMeth-content.md         \
	  03diagrams-content.md          \
	  04versionCtrl-content.md       \
	  05buildUtil-content.md         \
	  06testing-content.md           \
	  07errors-content.md            \
	  08generic-content.md           \
	  09reverse-content.md           \
	  10efficient-content.md         \
	  12applDeploy-content.md        \
	  13help-content.md              \
	  14packaging-content.md         \
	  15doc-content.md               \
	  16appendices-content.md        \
	  > $(basename)-content.md
clean :
	rm $(basename)-content.md *.log *.aux *.out *~
