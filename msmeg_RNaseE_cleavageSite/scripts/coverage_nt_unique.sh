#!/bin/bash

python3 excl_overlap_nt_rawCoverage.py ../coverage_normalization/msmeg_CombinedAnnotation_CDS_ntCoverageFiltered.bed ../RNAseq_processing/bowtie2_genome/coverage_nt/plus_fragment_coverage.txt plus > ../coverage_normalization/coverage_plus_CDSRawFilteredUniqueNt.txt

python3 excl_overlap_nt_rawCoverage.py ../coverage_normalization/msmeg_CombinedAnnotation_CDS_ntCoverageFiltered.bed ../RNAseq_processing/bowtie2_genome/coverage_nt/minus_fragment_coverage.txt minus > ../coverage_normalization/coverage_minus_CDSRawFilteredUniqueNt.txt
