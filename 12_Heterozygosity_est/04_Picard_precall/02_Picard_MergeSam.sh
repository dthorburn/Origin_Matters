#!/bin/bash
#$ -N Merging_Gynogene_PELibs
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=4:00:00
#$ -l h_vmem=12G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/03_Merged

newname="PELibs.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_gynogen_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_gynogen_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_gynogen_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

echo "All done"