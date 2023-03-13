#!/bin/bash

cd ../RNAseq_processing/fastq
for file in *R1.fastq;do
	base=${file%_*}
	java -jar ../../scripts/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 -trimlog ../../scripts/trim.log $file $base'_'R2.fastq ../fastq_trim/$base'_'R1.paired.fastq.gz ../fastq_trim/$base'_'R1.unpaired.fastq.gz ../fastq_trim/$base'_'R2.paired.fastq.gz ../fastq_trim/$base'_'R2.unpaired.fastq.gz SLIDINGWINDOW:4:20 MINLEN:25
done
