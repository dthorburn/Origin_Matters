#!/bin/bash
#$ -N X16A_SAMTOOLS_UpdateRGs
#$ -cwd
#$ -j y
#$ -l h_rt=1:00:00
#$ -l h_vmem=8G
#$ -t 1-132

module load samtools
module load gatk/4.1.6.0

## Extracting the relevant information from the file name
if [ ${SGE_TASK_ID} -le 66 ]
then 
  Genome="Peichel"
  ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 67 ]
then
  ID=`expr ${SGE_TASK_ID} - 66`
  Genome="Gynogene"
fi

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/06_RGUpdate

file=$DATA_DIR/BS"$ID".cleaned.sorted.merged.${Genome,,}.markdup.bam

outname=`basename $file | sed -e "s/.bam/.RGUpdate.bam/"`

## I want to maintain most of the RG. For some reason, some of the sample (SM) fields have messed up. 
## This just changes that section of the file. 
samtools view -H $file | sed "/^@RG/s/SM.*.gz/SM:BS${SGE_TASK_ID}/" | samtools reheader - $file > $OUT_DIR/"$outname"

samtools index $OUT_DIR/"$outname"
gatk BuildBamIndex -I $OUT_DIR/"$outname"
