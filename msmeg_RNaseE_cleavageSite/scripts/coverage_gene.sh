#!/bin/bash

for file in ../RNAseq_processing/bowtie2_genome/coverage_nt/*coverage;do
        base1=${file##*/}
	base2=${base1%.*}
        python3 coverage_per_gene.py ../RNAseq_processing/index/msmeg_CombinedAnnotation_CDS.bed $file > ../RNAseq_processing/bowtie2_genome/coverage_CDS/$base2.coverage_msmegCombinedCDS.txt
done
