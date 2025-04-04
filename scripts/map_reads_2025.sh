#!/usr/bin/env bash

module load hts/1.0

#want to map reads against mm10 genome

READ_DIR=/gpfs/projects/GenomicsCore/fastqs/Chan-03-25/Igarashi2_Project_007
SAMPLE=$1
REF=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.fa
FQ1=${READ_DIR}/${SAMPLE}_R1_001.fastq.gz
FQ2=${READ_DIR}/${SAMPLE}_R2_001.fastq.gz
OUTPUT=../bwa-mem_out_2025/

mkdir ${OUTPUT}

echo "Sample: ${SAMPLE}"


#### Step 0: Index with BWA ####

#echo "Indexing ${REF}"

#bwa index ${REF}

#### Step 1: Map with BWA (mem algorithm) #####
echo "mapping $SAMPLE"
bwa mem -5SP -t 12 -T0 $REF $FQ1 $FQ2 2> ../logs/$SAMPLE.bwa.mem.log | samtools view -bS - > $OUTPUT/$SAMPLE.bam 2> ../logs/$SAMPLE.bam.log

