#!/bin/bash
#$ -N X05_RAxML_Ind_ProcessBoots
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_rt=4:00:00
#$ -l h_vmem=8G
#$ -t 1-2

module load raxml/8.2.11

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
fi

ML_TREE=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/02_RAxML_Trees/01_MLTrees/"$Genome"_ML_100kTree
BOOTS=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/02_RAxML_Trees/02_Ind_Trees
OUT_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/02_RAxML_Trees/03_Supported_Tree

cd $OUT_DIR

## Adding bipartitions to the best ML tree based on the bootstraps.
raxmlHPC -p 104784 -m GTRCAT -f b -t $ML_TREE/RAxML_bestTree."$Genome"_ML_100kTree -z $BOOTS/"$Genome"_Bootstraps -n "$Genome"_Supported_100k
echo "All Done"