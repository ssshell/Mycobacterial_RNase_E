#!/bin/bash

cd ../RNAseq_processing/bowtie2_genome/sam
for file in *.sam;do
        base=${file%.*}
        samtools view -h -b -S $file -o ../bam/$base.bam
done
