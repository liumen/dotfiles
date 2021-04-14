#!/bin/bash

if type "redshift"; then 
  redshift -x  # remove all adjustments
  redshift -O 4000 
fi
