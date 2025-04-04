#!/usr/bin/env bash

# intersect statistically significant loop calls with DEG dataset bed file

GENEBED=/gpfs/projects/GenomicsCore/nf-core/cutandrun/Chan/intersect_DEgenes_BRD4_peaks/Mus_musculus.GRCm38.102.chr.DEGenes_padded100k.chromlabel.bed

NAMES="KO_Mock_GATAD2A KO_Mock_H3K27ac KO_Wnt3a_GATAD2A KO_Wnt3a_H3K27ac WT_Mock_GATAD2A WT_Mock_H3K27ac WT_Wnt3a_GATAD2A WT_Wnt3a_H3K27ac"

output=../loop_deg_intersections


mkdir ${output}

for name in ${NAMES}; do
	BED=../fithichip_output/${name}_10kbin_allinttypes/FitHiChIP_ALL2ALL_b10000_L10000_U2000000/Coverage_Bias/FitHiC_BiasCorr/Merge_Nearby_Interactions/${name}.interactions_FitHiC_Q0.1_MergeNearContacts.bed
	cut -f1,2,3 ${BED} | tail -n +2 > temp.bed;
	NUM_LOOPS=`wc -l ${BED} | awk ' {print $1} '`
	echo ${name} ${NUM_LOOPS};
	bedtools intersect -a temp.bed -b ${GENEBED} -wo > ${output}/${name}_DEgene_intersection.loops.bed;
        #rm temp.bed;	
done

