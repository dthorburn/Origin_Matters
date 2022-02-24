#!/bin/bash
#$ -N X05_Reference_Genome_PreCall
#$ -j y
#$ -cwd
#$ -t 561-1120
#$ -l h_rt=3:00:00
#$ -l h_vmem=6G

#module load singularity/2.5.1
module load gatk/4.1.6.0
#module load samtools/1.8

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 560 ]
then 
  Genome="Peichel"
  ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 561 ]
then
  Genome="Gynogene"
  ID=`expr ${SGE_TASK_ID} - 560`
fi

SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/06_Picard_PreCall/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/02_Mapped/"$Genome"/bam_files
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/01_FixMate
OUTDIR2=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/02_CleanSam

query_file=`sed $ID"q;d" $SCRIPT/01_File_List_Peichel.txt`
if [ $Genome == "Gynogene" ]
then
  query_file=`basename $query_file | sed -e "s/peichel_aligned.bam/gynogene_aligned.bam/"`
fi
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