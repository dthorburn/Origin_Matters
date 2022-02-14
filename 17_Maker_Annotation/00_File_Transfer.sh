#!/bin/bash
#$ -N X00_File_Transfer
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=6:00:00
#$ -l h_vmem=4G


DATA_DIR=/data/scratch/btx316/Comp_Genomics/22_Maker_Annotation/04_Full_Run_12Core
OUT_DIR=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/MT_Maker_round3

rsync -alzvh $DATA_DIR/* $OUT_DIR/

echo "All Done"