# HiChIP Workflow Diagram

```mermaid
flowchart TB
    FASTQ[Raw FASTQ reads] --> S1[Step 1: Align reads (BWA-MEM)]
    S1 --> BAM[Aligned reads (BAM)]
    BAM --> S2[Step 2: Parse & deduplicate (Pairtools)]
    S2 --> PAIRS[Valid pairs (.pairs file)]
    S2 --> FILTERED_BAM[Filtered valid BAM]
    PEAKS[ChIP-seq peaks (BED)] --> S3[Step 3: Enrichment QC]
    FILTERED_BAM --> S3
    S3 --> QC_METRICS[HiChIP enrichment metrics]
    PAIRS --> S4[Step 4: Build contact matrix (.hic via Juicer)]
    S4 --> HIC[Contact matrix (.hic)]
    PAIRS --> S5[Step 5: Build contact map (.cool via Cooler)]
    S5 --> COOL[Contact map (.cool)]
    PAIRS --> S6[Step 6: Call loops (FitHiChIP)]
    PEAKS --> S6
    S6 --> LOOPS[Significant loops (BEDPE)]
