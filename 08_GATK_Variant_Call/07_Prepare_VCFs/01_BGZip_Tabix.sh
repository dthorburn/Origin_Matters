#!/bin/bash
#$ -N BGZip_Tabix
#$ -cwd
#$ -j y
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#$ -t 1

module load samtools

DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/05_Filtering/Gynogene/Final

for file in $DATA_DIR/*.vcf
do
  echo $file
  bgzip $file
  tabix $file.gz
done

echo "All done"