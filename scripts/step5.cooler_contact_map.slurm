#!/usr/bin/env bash

#SBATCH --job-name=cooler
#SBATCH --output=../logs/cooler.WT_Wnt3a_H3K27ac.log
#SBATCH --time=48:00:00
#SBATCH -p extended-96core-shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=50g

module load pairtools

SAMPLE=WT_Wnt3a_H3K27ac
GENOME=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.genome
CONTACT=../contact_matrix

cooler cload pairix \
-p 16 \
${GENOME}:1000 \
../bwa-mem_out/${SAMPLE}.pairs.gz \
${CONTACT}/${SAMPLE}.cool
