PRINCIPALE = AlgoritmiTeoria
PRINCIPALE_TEX = $(PRINCIPALE).tex
PRINCIPALE_PDF = $(PRINCIPALE).pdf
PRINCIPALE_HTML = $(PRINCIPALE).html

.PHONY: pdf html clean

all: pdf clean

pdf: $(PRINCIPALE_PDF)

html: $(PRINCIPALE_HTML)

$(PRINCIPALE_PDF): $(PRINCIPALE_TEX)
	xelatex --shell-escape -interaction=nonstopmode -output-driver='xdvipdfmx -z3' $(PRINCIPALE)
	xelatex --shell-escape -interaction=nonstopmode -output-driver='xdvipdfmx -z3' $(PRINCIPALE)

$(PRINCIPALE_HTML): $(PRINCIPALE_TEX)
	pandoc --toc $(PRINCIPALE_TEX) -s --number-sections --mathjax --resource-path='./images' --extract-media=images -o $(PRINCIPALE_HTML)

clean:
	rm -f *.aux *.log *.toc *.out *.dvi

