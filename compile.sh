#! /bin/bash

MAIN="MMiller_PhDthesis"

MAIN_TEXFILE="${MAIN}.tex"


LATEX="pdflatex"
LATEX_CMD="-halt-on-error -synctex=1"
BIBTEX="bibtex"
BIBTEX_CMD=""

date +"%Y%m%d%H%M%S" > ./compile.timestamp

${LATEX} ${LATEX_CMD} ${MAIN_TEXFILE}

${BIBTEX} ${BIBTEX_CMD} ${MAIN} && \
    ${LATEX} ${LATEX_CMD} ${MAIN_TEXFILE}

exit 0

