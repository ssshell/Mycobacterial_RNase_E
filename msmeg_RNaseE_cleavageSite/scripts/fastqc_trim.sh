#!/bin/bash

cd ../RNAseq_processing/fastq_trim
for file in *paired.fastq;do
	fastqc $file -o ../fastqc_trim
done
