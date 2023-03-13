#!/bin/bash

python3 coverage_avgPerNt.py ../RNAseq_processing/index/msmeg_CDS_length.txt ../RNAseq_processing/bowtie2_genome/coverage_rawCDS.txt > ../coverage_normalization/coverage_avgPerNt.txt
