#!/usr/bin/env bash

module load hts/1.0

#want to map reads against mm10 genome

READ_DIR=/gpfs/projects/GenomicsCore/fastqs/Chan-12-23/concatenated_fastqs
SAMPLE=$1
REF=/gpfs/projects/GenomicsCore/indexes/mm10/mm10.fa
FQ1=${READ_DIR}/${SAMPLE}_R1_concat.fastq.gz
FQ2=${READ_DIR}/${SAMPLE}_R2_concat.fastq.gz
OUTPUT=../bwa-mem_out/

mkdir ${OUTPUT}

echo "Sample: ${SAMPLE}"


#### Step 0: Index with BWA ####

#echo "Indexing ${REF}"

#bwa index ${REF}

#### Step 1: Map with BWA (mem algorithm) #####
echo "mapping $SAMPLE"
bwa mem -5SP -t 96 -T0 $REF $FQ1 $FQ2 2> ../logs/$SAMPLE.bwa.mem.log | samtools view -bS - > $OUTPUT/$SAMPLE.bam 2> ../logs/$SAMPLE.bam.log

