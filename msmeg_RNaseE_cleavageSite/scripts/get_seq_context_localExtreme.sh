#!/bin/bash

for file in ../coverage_ratio/nt_position/local_extreme/*txt;do
	base1=${file##*/}
	base2=${base1%.*}
	python3 get_seq_at_nt.py ../RNAseq_processing/index/Mycobacterium_smegmatis_MC2-155_genome_v4.fasta $file 20 > ../nt_sequence_context/$base2.fa
done
