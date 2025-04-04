#!/usr/bin/env bash

module load pairtools

GENOME=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.genome
TEMP=/gpfs/scratch/decarlson/pairtools_temp
STATS_DIR=
SAMPLE=$1

pairtools parse --min-mapq 40 --walks-policy 5unique \
--max-inter-align-gap 30 --nproc-in 16 --nproc-out 16 --chroms-path ${GENOME} ../bwa-mem_out/${SAMPLE}.bam | \
pairtools sort --tmpdir="${TEMP}" --nproc 40 | pairtools dedup --nproc-in 16 \
--nproc-out 16 --mark-dups --output-stats ../stats/${SAMPLE}.stats | pairtools split --nproc-in 16 \
--nproc-out 16 --output-pairs ../bwa-mem_out/${SAMPLE}.pairs --output-sam -|samtools view -bS -@ 16 | \
samtools sort -@ 16 -o ../bwa-mem_out/${SAMPLE}.mapped.PT.bam

samtools index ../bwa-mem_out/${SAMPLE}.mapped.PT.bam
