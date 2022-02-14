#!/bin/bash
#$ -N X10c_LUMPY_Genotyping_FAILED
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=06:00:00
#$ -l h_vmem=4G
#$ -t 1-2

## Loading the LumpyAnalysis python environment
module load python/2.7.15
source /data/home/btx316/LumpyAnalysis/bin/activate

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 1 ]
then 
  Genome="Gynogene"
  chr_prefix="Gy_"
elif [ ${SGE_TASK_ID} -ge 2 ]
then
  Genome="Peichel"
  chr_prefix=""
fi

BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
DATA_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/02_LumpyExpress_Output/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Lumpys/"$Genome"

cd $OUT_DIR

## Running each sample against the bam file with it's reads
echo "Starting genotyping "$Genome`date`
svtyper \
    --verbose \
    -B $BAM_DIR/BS66.cleaned.sorted.merged."${Genome,,}".markdup.bam \
    -i $DATA_DIR/BS66_Lumpy_CNV_"$Genome"."$chr_prefix"chrI.bam.vcf \
    > $OUT_DIR/BS66_Lumpy_SV_"$Genome"."$chr_prefix"chrI_.Raw.GT.vcf

echo "Finished genotyping "$Genome" "${ID_List["$ID"]}" "$chr_prefix"chrI: "`date`
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"