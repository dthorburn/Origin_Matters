#!/bin/bash
#$ -N Migrate
#$ -j Y
#$ -cwd
#$ -t 1-118
#$ -pe smp 1 ## requesting 2 nodes
#$ -l h_rt=1:00:00
#$ -l h_vmem=2G

## Getting the R1 read
File=`sed ${SGE_TASK_ID}"q;d" /data/archive/archive-SBCS-EizaguirreLab/02_Missing_Files.txt`

echo $File

rsync $File /data/scratch/btx316/Comp_Genomics/00_Raw_Data/Redo

echo "Done"