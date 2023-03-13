#!/bin/bash

cd ../RNAseq_processing/bowtie2_genome/bam_split
for file in *.minus.bam;do
        base=${file%%.*}
        bedtools genomecov -d -pc -ibam $file > ../coverage_nt/$base'_'minus'_'fragment.coverage
        bedtools genomecov -d -pc -ibam $base.plus.bam > ../coverage_nt/$base'_'plus'_'fragment.coverage
done
