#!/bin/bash

cd ../RNAseq_processing/bowtie2_tRNArRNA/unaligned/
for file in *.1.fastq;do
	base=${file%%.*}
	bowtie2 -x ../../index/msmeg --very-sensitive -p 4 -a -1 $file -2 $base.2.fastq -S ../../bowtie2_genome/sam/$base.sam
done
