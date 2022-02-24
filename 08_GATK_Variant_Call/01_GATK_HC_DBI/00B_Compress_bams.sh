#!/bin/bash
#$ -N Compress_Bams_Gynogene
#$ -j y
#$ -cwd
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G
#$ -t 1-66

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/05_RGUpdate
DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/05_RGUpdate

for file in $DATA_DIR/BS"${SGE_TASK_ID}".cleaned*
do
  #gzip -9 $file
  gzip -d $file
done
echo "Done all Peichel"