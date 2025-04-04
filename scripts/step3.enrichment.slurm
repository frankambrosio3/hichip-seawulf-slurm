#!/usr/bin/env bash

#SBATCH --job-name=HiChip
#SBATCH --output=../logs/enrichment.KO_Wnt3a_H3K27ac.log
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p hbm-extended-96core

module load pairtools

./get_enrichment_stats.sh KO_Wnt3a_H3K27ac KO_Mock_H3K27AC_R2
