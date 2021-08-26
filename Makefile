# target = the thing to generate, so executables or object files
# dependency (or prerequisite) = file(s) used to create the target
# action (or recipe) = what 'make' actually does to turn dependency into target
#
# Macros:
#	$@ = target
# $< = first dependency
# $^ = all dependencies
# %  = pattern to watch in both target and dependency

# output: main.o dependency1.o dependency2.o ...
# 	g++ main.o dependency1.o dependency2.o ... -o <executable_name>
#
# target: dependencies
#		action

# Defining path variables
MAIN=DCCmoose
BUILD_DIR=build
PACK_DIR=packages
BIB_DIR=bibliography
SECTIONS= $(wildcard sections/*.tex) $(wildcard sections/*/*.tex) $(wildcard sections/*/*/*.tex)
# Tell the compiler which folder to find packages and classes in so the paths
# match in declaration
export TEXINPUTS:=.:./$(PACK_DIR):~/$(PACK_DIR):${TEXINPUTS}

LATEX_OPTS=-interaction=nonstopmode -shell-escape -aux-directory=$(BUILD_DIR) --synctex=1

# the default target
default: $(SECTIONS) *.tex $(BIB_DIR)/*.bib $(PACK_DIR)/*.sty
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex

# type `make` to generate pdf of main.tex:
all: $(MAIN).pdf

.PHONY: clean

# type `make clean` to clear all build files
clean:
	rm -rf $(BUILD_DIR)/* *.blg *.out *.bbl *.log *.ind *.ilg *.lot *.lof *.ind\
	 *.idx *.aux *.toc

# also removes all back-up and pdf files
superclean:
	make clean
	rm -rf $(PACK_DIR)/*.bak
	rm -rf *.pdf

# if making an index, run this after `make`. Have not personally tested or used this
index: $(MAIN).pdf
	makeindex $(BUILD_DIR)/$(MAIN)

# run `make bib` after `make` to generate bibliography with biblatex
bib: $(MAIN).pdf
	biber --output-directory=$(BUILD_DIR) $(MAIN)
	make force

# Can force make if main.tex is not edited, but any sub-files are:
force:
	touch $(MAIN).tex
	make

# type `make verbose` to see all of the pdflatex output
verbose: *.tex $(BIB_DIR)/*.bib $(PACK_DIR)/*.sty
	pdflatex $(LATEX_OPTS) $(MAIN).tex
	pdflatex $(LATEX_OPTS) $(MAIN).tex
	pdflatex $(LATEX_OPTS) $(MAIN).tex

continuous: $(MAIN).pdf
	while true; do make; sleep 1; done

# will be invoked everywhere there is a `target: $(MAIN).pdf` (i.e. a dependency)
# running pdflatex 3 times to make sure all references in the document are resolved
$(MAIN).pdf: $(SECTIONS) *.tex $(BIB_DIR)/*.bib $(PACK_DIR)/*.sty
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
	pdflatex $(LATEX_OPTS) -quiet $(MAIN).tex
