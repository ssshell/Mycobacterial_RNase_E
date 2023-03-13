
####### RNAseq_processing
###### this folder contains all the RNAseq libraries processing steps
##### quality check of raw fastq
./fastqc_raw.sh

##### trim sequence
#### result in trim_result.txt
./trim.sh

##### quality check of trimmed fastq
./fastqc_trim.sh

##### remove reads aligned to rRNA and tRNA
#### result in bowtie2_tRNArRNA_results.txt
./bowtie2_tRNArRNA.sh

##### align the remaining reads to genome
#### result in bowtie2_genome_results.txt
./bowtie2_genome.sh

##### processing alignments; quantify coverage
./sam2bam.sh
./sort_bam.sh
./filter.sh
./split_strand.sh
./coverage_base.sh
./coverage_strand.sh
./coverage_gene.sh
./coverage_gene_merge_strand.sh
./coverage_gene_merge_conditions.sh


####### coverage_normalization
###### this folder contains coverage normalization with total coverage of CDS only, without CV, size factor, tpm
##### get average nt coverage (sum of raw coverage/length of cds)
./coverage_average_nt.sh

##### filter CDS by nt average coverage
nt_avgCoverage.R

##### update CDS annotation file
awk 'NR==FNR {id[$1]; next} $1 in id' ../coverage_normalization/coverage_avgPerNtFiltered.txt ../RNAseq_processing/index/msmeg_CombinedAnnotation_CDS.bed > ../coverage_normalization/msmeg_CombinedAnnotation_CDS_ntCoverageFiltered.bed

##### get unique nt positions
#### exclude nts in overlapped CDS regions
./coverage_nt_unique.sh

##### normalize nt coverage by Total coverage
./coverage_nt_TotalCoverage.sh

##### split nt coverage files by conditions
./coverage_nt_by_conditions.sh


####### coverage_ratio
###### this folder contains all the coverage ratio calculations
##### combine pairwise coverage for ratio calculation
./get_ratio_condition.sh

##### calculate pairwise coverage ratios of each nt position
./get_coverage_ratio.sh

##### create groups by ratio percentage
#### for later comparing sequence context
get_nt_normalizedCoverageScaleGroup.R
get_nt_normalizedCoverageRatioGroup.R

##### get cleavage ratio distribution plots
viz_ntRatio_distributions.R


####### nt_sequence_context
###### this folder contains the relative nt usage of sequence context
##### get sequence context of given cleavage site. Here is 40 nt; upstream and downstream 20 nt, 41 nt in total
./get_seq_context_sequence.sh

##### this folder contains the relative nt usage of sequence context
./get_seq_context_FreqCount.sh

##### get sequence context plots
viz_sequenceContext.R

