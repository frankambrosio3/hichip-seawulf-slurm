#!/usr/bin/env bash

#SBATCH --job-name=FitHiChIP
#SBATCH --output=../logs/FitHiChIP_10kb_gnuparallel_allinttypes.log
#SBATCH --time=06:00:00
#SBATCH -p hbm-long-96core
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=96

module load anaconda/3
conda activate HiC-Pro_v3.1.0

module load gnu-parallel

export PATH=/gpfs/software/HiC-Pro/scripts:/gpfs/software/HiC-Pro/bin:$PATH

#SAMPLE=KO_Mock_GATAD2A
NAMES="KO_Mock_GATAD2A KO_Mock_H3K27ac KO_Wnt3a_GATAD2A KO_Wnt3a_H3K27ac WT_Mock_GATAD2A WT_Mock_H3K27ac WT_Wnt3a_GATAD2A WT_Wnt3a_H3K27ac"


parallel --verbose "/gpfs/software/FitHiChIP/FitHiChIP_HiCPro.sh \
-C ../fithichip_confs/{}.conf" ::: ${NAMES}
