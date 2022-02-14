#!/bin/bash
#$ -N X02_VCF2Phylip
#$ -cwd
#$ -j y
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#$ -t 1-2

module load python/2.7.15

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
fi

DATA_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/01_RandomSNPs

python /data/home/btx316/privatemodules/vcf2phylip/vcf2phylip.py \
  -i $DATA_DIR/All_Autosome_Random_100k_"$Genome"_SNPs_Filtered_Selected.vcf

python /data/home/btx316/privatemodules/vcf2phylip/vcf2phylip.py -r \
  -i $DATA_DIR/All_Autosome_Random_100k_"$Genome"_SNPs_Filtered_Selected.vcf
  
echo "All Done"