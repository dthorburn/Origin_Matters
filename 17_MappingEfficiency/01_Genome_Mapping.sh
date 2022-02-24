#!/bin/bash
#$ -N X01_MappingEfficiency
#$ -cwd
#$ -j y
#$ -l h_rt=2:00:00
#$ -l h_vmem=4G
#$ -t 1-66

module load bamtools

#Genome=Peichel
Genome=Gynogene

DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/00_BAMS/"$Genome"
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/21_MappingEfficiency/"$Genome"

bamtools stats -in $DATA_DIR/BS"${SGE_TASK_ID}".cleaned.sorted.merged."${Genome,,}".markdup.RGUpdate.bam > $OUT_DIR/BS"${SGE_TASK_ID}"."$Genome"
