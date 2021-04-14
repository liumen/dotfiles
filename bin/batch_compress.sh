#!/bin/bash

COMPRESS=tar
COMPRESS_FLAG='-cvzf'

SRCDIR=$1
DSTDIR=$2

for item in $SRCDIR/*; do 
  filename=${item##*/} 
  if [[ -f $item ]]; then
    echo "copying file: $item --> $DSTDIR/$filename"
    cp -v $item  $DSTDIR/$item > /dev/null
  elif [[ -d $item ]]; then
    echo "$COMPRESS $COMPRESS_FLAG $item --> $DSTDIR/$filename.tar.gz"
    $COMPRESS $COMPRESS_FLAG $DSTDIR/$filename.tar.gz $item > /dev/null
  fi
done
