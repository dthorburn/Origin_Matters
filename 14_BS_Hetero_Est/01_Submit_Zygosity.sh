#!/bin/bash
#$ -N Zygosity_est
#$ -cwd
#$ -j y
#$ -l h_rt=70:00:00
#$ -l h_vmem=24G
#$ -t 1-2

module load R/3.5.3

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome="Peichel"
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome="Gynogene"
fi

OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/16_BS_Hetero_Est

Rscript $OUT_DIR/00_VCF_HeteroEst.R $Genome

echo "All done"