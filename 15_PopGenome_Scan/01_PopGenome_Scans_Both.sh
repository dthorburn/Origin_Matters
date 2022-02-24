#!/bin/bash
#$ -N PopGenome_Both_References
#$ -j Y
#$ -cwd
#$ -t 1-2
#$ -pe smp 1 ## requesting 2 nodes
#$ -l h_rt=12:00:00
#$ -l h_vmem=14G

module load R/3.5.3

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome="Peichel"
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome="Gynogene"
fi

DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/01_VCFs/02_Filtered/"$Genome"
cd $DATA_DIR

Rscript /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/17_PopGenome_Scan/02_PopGenome_Scans_Both.R $Genome

echo "All done with "$Genome