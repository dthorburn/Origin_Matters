#!/bin/bash
#$ -N Picard_Markdups_Gynogene
#$ -j y
#$ -cwd
#$ -t 1-66
#$ -l h_rt=4:00:00
#$ -l highmem
#$ -l h_vmem=32G

module load gatk

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/03_Merged
DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/03_Merged
#OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/04_MarkDups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/04_MarkDups
#query_file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.peichel.bam
query_file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.gynogene.bam
newname=`basename $query_file | sed -e "s/.bam/.markdup.bam/"`
metricsname=`basename $query_file | sed -e "s/.bam/.markdup.txt/"`

gatk MarkDuplicates \
  -I $DATA_DIR/"$query_file" \
  -O $OUT_DIR/"$newname" \
  -M $OUT_DIR/"$metricsname"
  
echo "Step 1 done"

gatk BuildBamIndex \
  -I $OUT_DIR/"$newname"
  
echo "All Done"
