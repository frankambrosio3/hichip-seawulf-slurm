#!/usr/bin/env bash

#SBATCH --job-name=macs2
#SBATCH --output=../logs/macs2.log
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p hbm-extended-96core

module load hts

NAMES="KO_Mock_GATAD2A KO_Mock_H3K27ac KO_Wnt3a_GATAD2A KO_Wnt3a_H3K27ac WT_Mock_GATAD2A WT_Mock_H3K27ac WT_Wnt3a_GATAD2A WT_Wnt3a_H3K27ac"
OUTDIR=../macs2_out

mkdir ${OUTDIR}



for name in ${NAMES}; do
	#bamCoverage -b ${OUTDIR}/${name}.mapped.PT.bam -p 90 -of bedgraph -o ${OUTDIR}/${name}.coverage.bedgraph
	macs2 callpeak -t ../bwa-mem_out/${name}.primary.aln.bed --outdir ${OUTDIR} -n ${name};
done

