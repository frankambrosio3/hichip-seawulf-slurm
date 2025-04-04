#!/usr/bin/env bash

#SBATCH --job-name=mapreads
#SBATCH --output=../logs/bwa_mem_2025.log
#SBATCH --nodes=1
#SBATCH --time=12:00:00
#SBATCH -p hbm-long-96core

module load gnu-parallel

FQ_DIR=/gpfs/projects/GenomicsCore/fastqs/Chan-03-25/Igarashi2_Project_007


ls ${FQ_DIR}/*R1_001.fastq.gz | \
sed 's:.*/::; s/_R1.*//' | \
parallel --verbose -j 8 ./map_reads_2025.sh {}
