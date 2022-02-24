#!/bin/bash
#$ -N X01_RepeatMaskingGenomes
#$ -cwd
#$ -j y
#$ -pe smp 8
#$ -l h_rt=48:00:00
#$ -l h_vmem=6G
#$ -t 24-47

module load repeatmasker/4.0.7

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 23 ]
then 
  Genome="Peichel"
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome/Ind_Chroms
elif [ ${SGE_TASK_ID} -ge 24 ]
then
  Genome="Gynogene"
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/Ind_Chroms
fi
Tool=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/06_New_Pipeline_Whole
chroms=("EMPTY" "chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXIX" "chrXX" "chrXXI" "chrM" "chrUn" "Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVII" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXIV" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXIX" "Gy_chrXX" "Gy_chrXXI" "Gy_chrM" "Gy_chrUn")

echo "Starting masking of "${chroms["$SGE_TASK_ID"]}": "`date`

# Set a variable to take the value of half the allocated slots
REPCORES=`expr $NSLOTS / 2`

RepeatMasker -gff -species danio -pa $REPCORES $REFERENCE/"${chroms["$SGE_TASK_ID"]}"/"${chroms["$SGE_TASK_ID"]}".fa

echo "All Done"