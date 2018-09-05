TEXFILE = main.tex
PDFFILE = main.pdf

BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

#build_docker:
#	mkdir $(OUTPUTDIR)
#	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)"
#	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "makeindex main.idx -s StyleInd.ist"
#	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "biber main"
#	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)"
#	sudo docker run -it -v $(BASEDIR):/var/texlive texlive sh -c "pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)"
#	mv $(PDFFILE) $(OUTPUTDIR)/ai_script.pdf

build:
	mkdir $(OUTPUTDIR)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)
	makeindex main.idx -s StyleInd.ist
	biber main
	pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEXFILE)
	mv $(PDFFILE) $(OUTPUTDIR)/ai_script.pdf

homepage:
    mkdir docs/static/
	cp $(OUTPUTDIR)/ai_script.pdf docs/static
	cd docs
	hugo