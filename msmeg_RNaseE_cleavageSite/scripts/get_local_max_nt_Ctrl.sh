#!/bin/bash

for file in ../coverage_ratio/nt_position/*Ctrl.txt;do
	base1=${file##*/}
	base2=${base1%.*}
	python3 local_extreme_nt.py $file Control 15 max > ../coverage_ratio/nt_position/local_extreme/$base2'_'LocalMax_Ctrl.txt
done
