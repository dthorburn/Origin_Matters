#!/bin/bash
#$ -N Picard_Markdups_GynogenePELib
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=4:00:00
#$ -l highmem
#$ -l h_vmem=32G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/03_Merged
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
query_file=PELibs.cleaned.sorted.merged.gynogene.bam
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
