#!/usr/bin/env bash

module load pairtools

# get enrichment stats

GENOME=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.genome
STATS_DIR=../stats
BAM_DIR=../bwa-mem_out
#PEAKS_DIR=/gpfs/projects/GenomicsCore/nf-core/chipseq/Chan/chipseq_out_narrow/bwa/mergedLibrary/macs2/narrowPeak
PEAKS_DIR=/gpfs/projects/GenomicsCore/nf-core/cutandrun/Chan/H3K27AC_out/03_peak_calling/04_called_peaks/macs2
SAMPLE=$1
PEAKS_SAMPLE=$2

/gpfs/software/HiChiP/enrichment_stats.sh \
-g ${GENOME} \
-b ${BAM_DIR}/${SAMPLE}.mapped.PT.bam \
-p ${PEAKS_DIR}/${PEAKS_SAMPLE}.macs2_peaks.narrowPeak \
-t 90 \
-x ${STATS_DIR}/${SAMPLE}


# plot the results

python /gpfs/software/HiChiP/plot_chip_enrichment.py \
-bam ${BAM_DIR}/${SAMPLE}.mapped.PT.bam \
-peaks ${PEAKS_DIR}/${PEAKS_SAMPLE}.macs2_peaks.narrowPeak \
-output ${STATS_DIR}/${SAMPLE}_enrichment.png
