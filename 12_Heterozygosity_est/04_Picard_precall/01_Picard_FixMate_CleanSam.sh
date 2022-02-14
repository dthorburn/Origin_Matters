#!/bin/bash
#$ -N Picard_Gynogene_PreCall
#$ -j y
#$ -cwd
#$ -t 1-3
#$ -l node_type=nxv
#$ -l h_rt=6:00:00
#$ -l h_vmem=6G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/02_Mapped_Reads/bam_files
OUTDIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/01_FixMate
OUTDIR2=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/02_CleanSam

## Getting the file names
if [ ${SGE_TASK_ID} = 1 ]; then query_file="121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_gynogen_aligned.bam"; fi
if [ ${SGE_TASK_ID} = 2 ]; then query_file="121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_gynogen_aligned.bam"; fi
if [ ${SGE_TASK_ID} = 3 ]; then query_file="121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_gynogen_aligned.bam"; fi
echo $query_file

mid_name=`basename $query_file | sed -e "s/.bam/_FixMate.bam/"`
final_name=`basename $mid_name | sed -e "s/.bam/_CleanSam.bam/"`

gatk FixMateInformation \
  -I $DATA_DIR/"$query_file" \
  -O $OUTDIR/"$mid_name" \
  -SO coordinate

gatk CleanSam \
  -I $OUTDIR/"$mid_name" \
  -O $OUTDIR2/"$final_name"

rm $OUTDIR/"$mid_name"
echo "Done with "$query_file

