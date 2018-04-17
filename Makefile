#!/usr/bin/make -f

adocs = $(wildcard */*.adoc)
htmls = $(addprefix build/, $(adocs:.adoc=.html))
pdfs  = $(addprefix build/, $(adocs:.adoc=.pdf))

imgs  = $(wildcard */img/*.png) $(wildcard */img/*.jpeg)


all: doc
doc: html pdf

html: ${htmls}
pdf: ${pdfs}

clean:
	rm -rf build

build/%.html: %.adoc Makefile
	asciidoctor -b html5 -o $@ $<

build/%.pdf: %.adoc ${imgs} Makefile
	asciidoctor-pdf -o $@ $<


# EOF
