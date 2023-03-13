#!/bin/bash

cd ../RNAseq_processing/fastq
for file in *.fastq;do
	fastqc $file -o ../fastqc_raw
done
