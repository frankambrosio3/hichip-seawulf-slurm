#!/usr/bin/env bash

#SBATCH --job-name=cooler
#SBATCH --output=../logs/cooler-zoomify.WT_Wnt3a_H3K27ac.log
#SBATCH --time=2:00:00
#SBATCH -p short-96core-shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=50g

module load pairtools

SAMPLE=WT_Wnt3a_H3K27ac
CONTACT=../contact_matrix

cooler zoomify \
--balance \
-p 16 \
${CONTACT}/${SAMPLE}.cool
