#!/bin/bash

cd ../RNAseq_processing/bowtie2_genome/bam_filtered
for file in *.bam;do
        base=${file%%.*}
        samtools view -h -f 0x0040 $file | samtools view -bS -f 0x0002 -o ../bam_split/$base.properReads1.bam
        samtools view -h -f 0x0080 $file | samtools view -bS -f 0x0002 -o ../bam_split/$base.properReads2.bam
        samtools view -bh -f 0x10 ../bam_split/$base.properReads1.bam > ../bam_split/$base.properReads1_reverse.bam
        samtools view -bh -F 0x10 ../bam_split/$base.properReads1.bam > ../bam_split/$base.properReads1_forward.bam
        samtools view -bh -f 0x10 ../bam_split/$base.properReads2.bam > ../bam_split/$base.properReads2_reverse.bam
        samtools view -bh -F 0x10 ../bam_split/$base.properReads2.bam > ../bam_split/$base.properReads2_forward.bam
        samtools merge -f ../bam_split/$base.plus.bam ../bam_split/$base.properReads1_reverse.bam ../bam_split/$base.properReads2_forward.bam
        samtools merge -f ../bam_split/$base.minus.bam ../bam_split/$base.properReads1_forward.bam ../bam_split/$base.properReads2_reverse.bam
        samtools index ../bam_split/$base.plus.bam
        samtools index ../bam_split/$base.minus.bam
done
