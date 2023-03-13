#!/bin/bash

for file in ../nt_sequence_context/*fa;do
	base1=${file##*/}
	base2=${base1%.*}
	python3 get_nt_freq.py $file 41 > ../nt_sequence_context/$base2'_'FreqCount.txt
done
