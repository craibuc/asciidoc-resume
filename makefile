# shell commands
A2X = a2x
ASCIIDOC = asciidoc

ECHO = @echo
EXPORT = export
PWD = $(shell pwd)


TARGET = $(if $(doc), addendum, resume)

# TARGET = resume
# TARGET = addendum

# echo argument is $(FOO)

# ifdef $(FOO)
# 	echo argument is $(FOO)
# 	$TARGET := $(FOO)
# endif

XML_CATALOG_FILES = /usr/local/Cellar/docbook-xsl/1.78.1/docbook-xsl/catalog.xml

# EPUB
DOCBOOK_OPTS = --format=docbook

# --iconsdir==/usr/local/etc/asciidoc/images/icons
# EPUB
# EPUB_OPTS = --format=epub --conf-file=a2x.conf --stylesheet=resume.css --attribute=docinfo

# HTML
# HTML_OPTS = -a max-width=55em -a stylesheet=./asciidoc.css
HTML_OPTS = -a noheader -a max-width=55em -a linkcss -a stylesdir=$(shell pwd)

# PDF
# PDFOPTS = --format=pdf --conf-file=a2x.conf --fop
PDF_OPTS = --verbose --format=pdf --stylesheet=asciidoc.css --fop --no-xmllint

all: create_html create_pdf #create_epub

# epub: create_epub
	
html: create_html

pdf: create_pdf

docbook: create_docbook

create_docbook:
	$(ASCIIDOC) ${DOCBOOK_OPTS} ${TARGET}.asc; \
	
#  Generate EPUB
# create_epub: # create_folder
# 	$(EXPORT) XML_CATALOG_FILES=${XML_CATALOG_FILES}; \
# 	$(A2X) ${EPUB_OPTS} ${TARGET}.asc; \

#  Generate PDF
create_html:
	$(ASCIIDOC) ${HTML_OPTS} ${TARGET}.asc; \

#  Generate PDF
create_pdf: # create_folder
	$(EXPORT) XML_CATALOG_FILES=${XML_CATALOG_FILES}; \
	$(A2X) ${PDF_OPTS} ${TARGET}.asc; \