#!/bin/bash

for file in ../RNAseq_processing/bowtie2_genome/coverage_CDS/*plus*txt;do
	base1=${file##*/}
        base2=${base1%%.*}
        base3=${base2%_*}
        base4=${base3%_*}
        python3 combine_coverage.py $file | sort > ../RNAseq_processing/bowtie2_genome/coverage_CDScombined/$base4.txt
done
