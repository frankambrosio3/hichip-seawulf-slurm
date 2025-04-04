#!/usr/bin/env bash

module load pairtools

# convert pairtools output bams to bigWig


BAM_DIR=../bwa-mem_out
SAMPLE=$1

bamCoverage \
-b ${BAM_DIR}/${SAMPLE}.mapped.PT.bam \
-of bigwig \
-p 24 \
-v \
-o ${BAM_DIR}/${SAMPLE}.bw
