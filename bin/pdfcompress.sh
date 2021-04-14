#!/bin/bash
# Compress a scanned pdf

FILENAME=$1

# verify input
if [ ! -z $FILENAME ] && [ $FILENAME==*".pdf" ];then
    FNAME=${FILENAME%.pdf}
    OUTFILENAME=$FNAME"_compressed.pdf"
else
    echo "Illegal input. Input filename must be a *.pdf file."
    exit 1
fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dBATCH  -dQUIET \
   -sOutputFile=$OUTFILENAME $FILENAME
echo "Compression successful. Output written to $OUTFILENAME"
