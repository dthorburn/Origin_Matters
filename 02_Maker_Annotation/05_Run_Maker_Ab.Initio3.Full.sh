#!/bin/bash
#$ -N X05_mkRdIIIc
#$ -o /data/scratch/btx316/Comp_Genomics/22_Maker_Annotation/04_Full_Run_8Core
#$ -pe smp 8
#$ -cwd
#$ -j y
#$ -l h_vmem=10G
#$ -l h_rt=240:0:0

module load maker/2.31.9-mpi

OUTDIR=/data/scratch/btx316/Comp_Genomics/22_Maker_Annotation/04_Full_Run_8Core
SCRIPTS=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3

cd $OUTDIR

export HMMER_NCPU=0
export AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config

## Maker command to run on parallel cores
mpiexec -np 8 maker $SCRIPTS/maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl


## Maker command to run on a single core (run this first setting smp 1 and vmem=10G; just to check if you will get any errors)
## Also to make sure that it runs and it generates files correctly, you will need to check the log files and especially the 
## "XXX_master_datastore_index.log" This file is within the maker.output dir that will be created within your $OUTDIR.
## We can have a quick skype if you want and share me your screen to check these files. There is a chance that you will get
## no error but the annotation won't be running...
#maker $SCRIPTS/maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl
