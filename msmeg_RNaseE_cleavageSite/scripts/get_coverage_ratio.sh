#!/bin/bash

python3 get_coverage_ratio.py ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_EKDAtc_EKDnoAtc.txt | sort -n > ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_EKDAtc_to_EKDnoAtc_Ratio.txt

python3 get_coverage_ratio.py ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_EKDAtc_EKDnoAtc.txt | sort -n > ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_EKDAtc_to_EKDnoAtc_Ratio.txt

python3 get_coverage_ratio.py ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_conAtc_connoAtc.txt | sort -n > ../coverage_ratio/coverage_plus_NtCDSNormFilteredUnique_conAtc_to_connoAtc_Ratio.txt

python3 get_coverage_ratio.py ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_conAtc_connoAtc.txt | sort -n > ../coverage_ratio/coverage_minus_NtCDSNormFilteredUnique_conAtc_to_connoAtc_Ratio.txt

