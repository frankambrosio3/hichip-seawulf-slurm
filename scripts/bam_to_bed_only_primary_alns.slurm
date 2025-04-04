#!/usr/bin/env bash

#SBATCH --job-name=bamCoverage
#SBATCH --output=../logs/bam_to_bed.log
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p hbm-extended-96core

module load hts

NAMES="KO_Mock_GATAD2A KO_Mock_H3K27ac KO_Wnt3a_GATAD2A KO_Wnt3a_H3K27ac WT_Mock_GATAD2A WT_Mock_H3K27ac WT_Wnt3a_GATAD2A WT_Wnt3a_H3K27ac"
OUTDIR=../bwa-mem_out

for name in ${NAMES}; do
	#bamCoverage -b ${OUTDIR}/${name}.mapped.PT.bam -p 90 -of bedgraph -o ${OUTDIR}/${name}.coverage.bedgraph
	samtools view -h -F 0x900 ${OUTDIR}/${name}.mapped.PT.bam | bedtools bamtobed -i stdin > ${OUTDIR}/${name}.primary.aln.bed;
done

