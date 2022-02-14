#!/bin/bash
#$ -N Zygosity_sums
#$ -cwd
#$ -j y
#$ -l h_rt=2:00:00
#$ -l h_vmem=4G
#$ -t 1

module load R/3.5.3

OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/16_BS_Hetero_Est

Rscript $OUT_DIR/00B_Compile_all.R

echo "All done"