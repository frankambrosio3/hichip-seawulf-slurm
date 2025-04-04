#!/usr/bin/env bash

#SBATCH --job-name=HiChip
#SBATCH --output=../logs/juicer.WT_Wnt3a_H3K27ac.log
#SBATCH --time=48:00:00
#SBATCH -p extended-96core-shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50g

module load openjdk/latest

JUICER_JAR=/gpfs/software/juicer_tools/1.22.01/juicer_tools_1.22.01.jar
SAMPLE=WT_Wnt3a_H3K27ac
GENOME=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.genome
CONTACT=../contact_matrix

mkdir ${CONTACT}

java \
-Xmx48000m \
-Djava.awt.headless=true \
-jar ${JUICER_JAR} \
pre \
--threads 32 \
../bwa-mem_out/${SAMPLE}.pairs \
${CONTACT}/${SAMPLE}.hic \
${GENOME}
