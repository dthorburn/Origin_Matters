#!/bin/bash
#$ -N X03_RAxML_MLSearch
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_rt=48:00:00
#$ -l h_vmem=12G
#$ -t 2

module load raxml/8.2.11

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
fi
DATA_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/01_RandomSNPs
OUT_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/02_RAxML_Trees/01_MLTrees

gene=$DATA_DIR/All_Autosome_Random_100k_"$Genome"_SNPs_Filtered_Selected.min4.phy

## Creating all the names required
#newname=`basename $gene | sed -e "s/_SNPs_Filtered_Selected.min4.phy/ML_Trees/"`
newname="$Genome"_ML_100kTree2
echo $newname
#bootstrap_name=RAxML_bootstrap."$newname"
#echo $bootstrap_name
#finalname="$newname"_FinalMRE
#echo $finalname

## Moving to output directory and creating new file name
cd $OUT_DIR
mkdir $newname
cd $newname

## Finding the best ML tree based on 20 attempts. 
raxmlHPC -m GTRGAMMA -p 3004 -N 20 -s $gene -n $newname

## Genetating the extended majority rule ML tree from bootstapped analysis
#raxmlHPC -m GTRCAT -J MRE -z $bootstrap_name -n $finalname 

echo "All Done"