#!/bin/bash

bsqEx2filename="bsq_ex2_part4_"$1".sql"
bsqEx2Rsetfilename="bsq_ex2_reset_"$1".txt"

echo "Creating "$bsqEx2filename" file"

if test -f "$bsqEx2filenamee"; then
rm $bsqEx2filename
fi

echo "load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.GO_REGION_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE GO_REGION_DIM overwrite;" >> $bsqEx2filename


echo "Creating $bsqEx2Rsetfilename file"

if test -f "$bsqEx2Rsetfilename"; then
rm $bsqEx2Rsetfilename
fi

echo "" >> $bsqEx2Rsetfilename
