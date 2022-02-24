#!/bin/bash
#$ -N X13_Fixing_RGs
#$ -j Y
#$ -cwd
#$ -t 1-29
#$ -pe smp 1
#$ -l h_rt=1:00:00
#$ -l h_vmem=4G

module load samtools

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/04_MarkDups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/05_Split_RGs

R1_file=`sed ${SGE_TASK_ID}"q;d" $OUT_DIR/All_Failed_Lumpy.txt`
ID=`echo $R1_file | grep -o "BS[0-9][0-9]"`
echo $ID $R1_file
samtools view -b -r $R1_file $DATA_DIR/"$ID".cleaned.sorted.merged.gynogene.markdup.bam > $OUT_DIR/"$ID"_RG_"$R1_file".bam

echo "All Done"