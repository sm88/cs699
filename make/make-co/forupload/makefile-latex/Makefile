IMGP=Sources/Images
TEXP=Sources/TexFiles
SVGP=Sources/OtherFiles

all: paper.pdf 

paper.pdf: paper.ps
	ps2pdf paper.ps >/dev/null 2>/dev/null

paper.ps: paper.dvi
	dvips paper.dvi >/dev/null 2>/dev/null
	
paper.dvi: $(IMGP)/1.eps $(IMGP)/2.eps $(IMGP)/3.eps $(IMGP)/4.eps paper.tex Sources/paper.bib $(TEXP)/sec1.tex $(TEXP)/sec8.tex
	latex paper.tex >/dev/null 2>/dev/null  
	bibtex paper.aux >/dev/null 2>/dev/null
	latex paper.tex >/dev/null 2>/dev/null
	latex paper.tex >/dev/null 2>/dev/null

$(IMGP)/1.eps: $(SVGP)/1.svg
	inkscape -D --export-eps=$(IMGP)/1.eps $(SVGP)/1.svg

$(IMGP)/2.eps: $(SVGP)/2.svg
	inkscape -D --export-eps=$(IMGP)/2.eps $(SVGP)/2.svg

$(IMGP)/3.eps: $(SVGP)/3.svg
	inkscape -D --export-eps=$(IMGP)/3.eps $(SVGP)/3.svg
        
$(IMGP)/4.eps: $(SVGP)/4.svg
	inkscape -D --export-eps=$(IMGP)/4.eps $(SVGP)/4.svg

.PHONY: clean

clean: 
	rm -fv paper.aux $(IMGP)/*.eps paper.bbl paper.blg paper.dvi *.log *.ps *.pdf
