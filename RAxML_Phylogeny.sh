######################## Script 1 - ML Tree Search
#!/bin/bash
module load raxml/8.2.11

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
fi

## Finding the best ML tree using 20 attempts
Alignment=$DATA_DIR/All_Autosome_Random_100k_${Genome}_SNPs_Filtered_Selected.phy
raxmlHPC -m GTRGAMMA -p 3004 -N 20 -s ${Alignment} -n ${Genome}_ML_100kTree

######################## Script 2 - 1000 Bootstraps
#!/bin/bash
module load raxml/8.2.11

if [ ${SGE_TASK_ID} -le 500 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} -ge 501 ]
then
  Genome=Gynogene
fi

Alignment=$DATA_DIR/All_Autosome_Random_100k_${Genome}_SNPs_Filtered_Selected.phy
seed=$(sed -n "${SGE_TASK_ID}p" $SEED_DIR/WG_RAxML_Seeds.txt)

raxmlHPC -f d -m GTRGAMMA -b ${seed} -p ${seed} -N 10 -s ${Alignment} -n RAxML_bootstrap.${Genome}_${seed}_100k

######################## Script 3 - Adding support to ML tree
#!/bin/bash
module load raxml/8.2.11

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
fi

cat RAxML_bootstrap.${Genome}_*_100k >> ${Genome}_Bootstraps

raxmlHPC -p 104784 -m GTRCAT -f b -t $ML_TREE/RAxML_bestTree.${Genome}_ML_100kTree -z ${Genome}_Bootstraps -n ${Genome}_Supported_100k
