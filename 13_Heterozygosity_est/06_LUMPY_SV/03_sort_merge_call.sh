#!/bin/bash
#$ -N LumpyExpress_Merge_GynogenePELib
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=48:00:00
#$ -l h_vmem=10G

module load python/2.7.15

Raw_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/02_LumpyExpress
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/02_LumpyExpress
SCRIPT=/data/home/btx316/privatemodules/lumpy-sv/scripts

## Running lsort from svtools
python ~/.local/lib/python2.7/site-packages/svtools/lsort.py -r $Raw_DIR/PELibs_Lumpy_SV.bam.vcf > $OUT_DIR/PELibs_Lumpy_SV.sorted.bam.vcf

echo "Sorting complete"

## Runing lmerge from svtools
python ~/.local/lib/python2.7/site-packages/svtools/lmerge.py \
  -p 20 \
  -i $OUT_DIR/PELibs_Lumpy_SV.sorted.bam.vcf > $OUT_DIR/PELibs_Lumpy_SV.sorted.merged.bam.vcf
  
echo "Merging complete"