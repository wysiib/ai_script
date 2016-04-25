TEXFILE = main.tex
PDFFILE = main.pdf

BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

build:
	mkdir $(OUTPUTDIR)
	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex $(TEXFILE)"
	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "makeindex main.idx -s StyleInd.ist"
	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "biber main"
	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex $(TEXFILE)"
	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex $(TEXFILE)"
	mv $(PDFFILE) $(OUTPUTDIR)
