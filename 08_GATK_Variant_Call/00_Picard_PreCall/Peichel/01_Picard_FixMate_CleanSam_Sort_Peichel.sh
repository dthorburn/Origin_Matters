#!/bin/bash
#$ -N Picard_Peichel_PreCall
#$ -j y
#$ -cwd
#$ -t 2-560
#$ -l node_type=nxv
#$ -l h_rt=6:00:00
#$ -l h_vmem=6G

#module load singularity/2.5.1
module load gatk
#module load samtools/1.8

SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/06_Picard_PreCall/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/02_Mapped/Peichel/bam_files
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/01_FixMate
#OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/01_FixMate
OUTDIR2=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/02_CleanSam
#OUTDIR2=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/02_CleanSam
#CONTAINERS=/data/SBCS-Informatics/singularity/images

query_file=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/01_File_List_Peichel.txt`
#query_file=`sed ${SGE_TASK_ID}"q;d" $DATA_DIR/01_File_List_Gynogene.txt`
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
