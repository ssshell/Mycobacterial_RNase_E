#!/bin/bash

python3 normalize_coverage_TotalCoverage.py ../coverage_normalization/msmeg_CombinedAnnotation_CDS_ntCoverageFiltered.bed ../coverage_normalization/coverage_plus_CDSRawFilteredUniqueNt.txt plus > ../coverage_normalization/coverage_plus_normByTotalCoverage.txt

python3 normalize_coverage_TotalCoverage.py ../coverage_normalization/msmeg_CombinedAnnotation_CDS_ntCoverageFiltered.bed ../coverage_normalization/coverage_minus_CDSRawFilteredUniqueNt.txt minus > ../coverage_normalization/coverage_minus_normByTotalCoverage.txt
