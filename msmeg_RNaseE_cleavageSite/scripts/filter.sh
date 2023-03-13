#!/bin/bash

cd ../RNAseq_processing/bowtie2_genome/bam_sorted
for file in *.bam;do
        base=${file%%.*}
        samtools view -b -q 10 -F 260 $file > ../bam_filtered/$base.filtered.bam
done
