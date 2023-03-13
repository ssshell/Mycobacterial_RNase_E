#!/bin/bash

paste ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_EKD_Atc.txt ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_EKD_noAtc.txt | cut -f1-5,8-10 > ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_EKDAtc_EKDnoAtc.txt

paste ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_EKD_Atc.txt ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_EKD_noAtc.txt | cut -f1-5,8-10 > ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_EKDAtc_EKDnoAtc.txt

paste ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_con_Atc.txt ../coverage_normalization/coverage_nt_ByCondition/coverage_plus_NtCDSNormFilteredUnique_con_noAtc.txt | cut -f1-5,8-10 > ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_conAtc_connoAtc.txt

paste ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_con_Atc.txt ../coverage_normalization/coverage_nt_ByCondition/coverage_minus_NtCDSNormFilteredUnique_con_noAtc.txt | cut -f1-5,8-10 > ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_conAtc_connoAtc.txt
