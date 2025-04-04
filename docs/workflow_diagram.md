# HiChIP Workflow Diagram

```mermaid
flowchart TB
    FASTQ[/Raw FASTQ reads/] --> S1[Step 1: Align reads (BWA-MEM)]
    S1 --> BAM[/Aligned reads (BAM)/]
    BAM --> S2[Step 2: Parse & deduplicate (Pairtools)]
    S2 --> Pairs[/Valid pairs (.pairs file)/]
    S2 --> Fbam[/Filtered valid BAM/]
    Peaks[/ChIP-seq peaks (BED)/] --> S3[Step 3: Enrichment QC]
    Fbam --> S3
    S3 --> QC[/HiChIP enrichment metrics/]
    Pairs --> S4[Step 4: Build contact matrix (.hic via Juicer)]
    S4 --> HIC[/Contact matrix (.hic)/]
    Pairs --> S5[Step 5: Build contact map (.cool via Cooler)]
    S5 --> COOL[/Contact map (.cool)/]
    Pairs --> S6[Step 6: Call loops (FitHiChIP)]
    Peaks --> S6
    S6 --> Loops[/Significant loops (BEDPE)/]
