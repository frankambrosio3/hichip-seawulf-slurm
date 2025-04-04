#!/usr/bin/env bash

#SBATCH --job-name=pairtools
#SBATCH --output=../logs/pairtools.WT_Wnt3a_H3K27ac.log
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p hbm-extended-96core

module load pairtools/1.0

./pairtools_pipe.sh WT_Wnt3a_H3K27ac
