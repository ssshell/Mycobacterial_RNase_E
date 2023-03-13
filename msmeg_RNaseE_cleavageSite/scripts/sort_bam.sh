#!/bin/bash

cd ../RNAseq_processing/bowtie2_genome/bam
for file in *.bam;do
	base=${file%.*}
	samtools sort $file -o ../bam_sorted/$base.sorted.bam
done
