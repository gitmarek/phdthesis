#! /bin/bash

MAIN="MMiller_PhDthesis"

MAIN_TEXFILE="${MAIN}.tex"

LATEX="pdflatex"
LATEX_CMD="-halt-on-error -synctex=1"
BIBTEX="bibtex"
BIBTEX_CMD=""

MAKEINDEX="makeindex"
MAKEINDEX_CMD=""

date +"%Y%m%d%H%M%S" > ./compile.timestamp

echo "### Compiling LaTeX sources..."
${LATEX} ${LATEX_CMD} ${MAIN_TEXFILE}

echo "### BibTeX"
${BIBTEX} ${BIBTEX_CMD} ${MAIN} && \
    ${LATEX} ${LATEX_CMD} ${MAIN_TEXFILE}

echo "### make index andd index of symbols"
${MAKEINDEX} ${MAKEINDEX_CMD} idx
${MAKEINDEX} ${MAKEINDEX_CMD} sym

exit 0

