#!/bin/bash
#$ -N X04_RAxML_Ind_Bootstraps
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G
#$ -t 1-200

module load raxml/8.2.11

if [ ${SGE_TASK_ID} -le 100 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} -ge 101 ]
then
  Genome=Gynogene
fi
DATA_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/01_RandomSNPs
OUT_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/02_RAxML_Trees/02_Ind_Trees
SEED_DIR=/data/SBCS-EizaguirreLab/Miles/Scripts/Attempt3/12_PAML

## Creating all the names required 
gene=$DATA_DIR/"All_WG_Concat_astrm.fasta"
seed=$(sed -n "${SGE_TASK_ID}p" $SEED_DIR/WG_RAxML_Seeds_Best.txt)
echo $seed

gene=$DATA_DIR/All_Autosome_Random_100k_"$Genome"_SNPs_Filtered_Selected.min4.phy

## Creating all the names required
newname=`basename $gene | sed -e "s/.min4.phy//"`
echo $newname
finalname="$newname"_FinalMRE
echo $finalname
bootstrap_name=RAxML_bootstrap."$Genome"_"$seed"_100k
echo $bootstrap_name

## Moving to output directory and creating new file name
cd $OUT_DIR
mkdir $bootstrap_name
cd $bootstrap_name 

## Bootstrapping the alingment
raxmlHPC -f d -m GTRGAMMA -b $seed -p $seed -N 10 -s $gene -n $bootstrap_name

## Genetating the extended majority rule ML tree from bootstapped analysis
#raxmlHPC -m GTRCAT -J MRE -z $bootstrap_name -n $finalname 

echo "All Done"