```mermaid
flowchart TB
FASTQ[Raw FASTQ reads] --> STEP1[Step 1: BWA alignment]
STEP1 --> BAM[Aligned BAM files]
BAM --> STEP2[Step 2: Pairtools filtering]
STEP2 --> PAIRS[Valid .pairs files]
STEP2 --> FILTERED_BAM[Filtered BAM files]
FILTERED_BAM --> STEP3[Step 3: Enrichment QC]
PEAKS[ChIP-seq peak BED file] --> STEP3
STEP3 --> QC_METRICS[Enrichment QC metrics]
PAIRS --> STEP4[Step 4: Juicer .hic matrix]
STEP4 --> HIC[Contact matrix (.hic)]
PAIRS --> STEP5[Step 5: Cooler .cool map]
STEP5 --> COOL[Contact map (.cool)]
PAIRS --> STEP6[Step 6: Loop calling (FitHiChIP)]
PEAKS --> STEP6
STEP6 --> LOOPS[Significant loops (BEDPE)]
```
