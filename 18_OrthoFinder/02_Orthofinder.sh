#!/bin/bash
#$ -N X02_Orthofinder
#$ -cwd
#$ -j y
#$ -pe smp 4
#$ -l h_rt=4:00:00
#$ -l h_vmem=6G

module load python/2.7.15

Tool=/data/home/btx316/privatemodules/OrthoFinder_source
DATA_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/23_OrthoFinder/01_Annotations/AA_Seqs
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/23_OrthoFinder/02_Orthology

source $Tool/Ortho/bin/activate

cd $OUT_DIR

echo "Starting: "`date`
python $Tool/orthofinder.py -a 4 -f $DATA_DIR
echo "All done: "`date`