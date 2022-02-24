#!/bin/bash
#$ -N FastQC_All_Reads
#$ -j Y
#$ -cwd
#$ -t 2-1121
#$ -pe smp 1 ## requesting 2 nodes
#$ -l h_rt=0:20:00
#$ -l h_vmem=6G

module load fastqc

DATA_DIR=/data/scratch/btx316/Comp_Genomics/00_Raw_Data
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/03_FastQC/all_output
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/03_FastQC

query_file=`sed ${SGE_TASK_ID}"q;d" $SCRIPTS/01_File_List.txt`
echo $query_file

fastqc -o $OUT_DIR/ $DATA_DIR/"$query_file" 

echo "Done"