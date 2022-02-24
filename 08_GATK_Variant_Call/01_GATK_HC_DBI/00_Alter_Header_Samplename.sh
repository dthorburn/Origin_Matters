#!/bin/bash
#$ -N Update_RG_SM_Field_Gynogene
#$ -cwd
#$ -j y
#$ -l h_rt=1:00:00
#$ -l h_vmem=8G
#$ -t 1-66

module load samtools
module load gatk

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/04_MarkDups
DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/04_MarkDups
#OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/05_RGUpdate
OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/05_RGUpdate

#file=$DATA_DIR/BS"${SGE_TASK_ID}".cleaned.sorted.merged.peichel.markdup.bam
file=$DATA_DIR/BS"${SGE_TASK_ID}".cleaned.sorted.merged.gynogene.markdup.bam

outname=`basename $file | sed -e "s/.bam/.RGUpdate.bam/"`

## I want to maintain most of the RG. For some reason, some of the sample (SM) fields have messed up. 
## This just changes that section of the file. 
samtools view -H $file | sed "/^@RG/s/SM.*.gz/SM:BS${SGE_TASK_ID}/" | samtools reheader - $file > $OUT_DIR/"$outname"

samtools index $OUT_DIR/"$outname"
gatk BuildBamIndex -I $OUT_DIR/"$outname"