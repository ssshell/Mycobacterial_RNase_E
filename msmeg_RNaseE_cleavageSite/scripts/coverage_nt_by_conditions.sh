#!/bin/bash

cut -f1-5 ../coverage_normalization/coverage_plus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_con_Atc.txt
cut -f1-2,6-8 ../coverage_normalization/coverage_plus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_con_noAtc.txt
cut -f1-2,9-11 ../coverage_normalization/coverage_plus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_EKD_Atc.txt
cut -f1-2,12-14 ../coverage_normalization/coverage_plus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_EKD_noAtc.txt

cut -f1-5 ../coverage_normalization/coverage_minus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_con_Atc.txt
cut -f1-2,6-8 ../coverage_normalization/coverage_minus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_con_noAtc.txt
cut -f1-2,9-11 ../coverage_normalization/coverage_minus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_EKD_Atc.txt
cut -f1-2,12-14 ../coverage_normalization/coverage_minus_normByTotalCoverage.txt > ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_EKD_noAtc.txt
