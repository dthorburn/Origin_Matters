#!/bin/bash
#$ -N X07_Picard_Markdups
#$ -j y
#$ -cwd
#$ -t 67-132
#$ -l h_rt=4:00:00
#$ -pe smp 2
#$ -l h_vmem=16G

module load gatk/4.1.6.0

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 66 ]
then 
  Genome="Peichel"
  ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 67 ]
then
  Genome="Gynogene"
  ID=`expr ${SGE_TASK_ID} - 66`
fi

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/03_Merged
OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
query_file=BS"$ID".cleaned.sorted.merged."${Genome,,}".bam
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
