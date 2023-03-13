#!/bin/bash

cd ../RNAseq_processing/fastq_trim
for file in *_R1.paired.fastq;do
	base=${file%_*}
	bowtie2 -x ../index/msmeg_tRNArRNA --very-sensitive -p 4 -1 $file -2 $base'_'R2.paired.fastq -S ../bowtie2_tRNArRNA/sam/$base.sam --un-conc ../bowtie2_tRNArRNA/unaligned/$base.fastq
done
