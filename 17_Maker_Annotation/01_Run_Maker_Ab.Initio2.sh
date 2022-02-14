#!/bin/bash
#$ -N X01_mkRdIIc_Test
#$ -o /data/scratch/btx316/Comp_Genomics/22_Maker_Annotation/01_Test
#$ -pe smp 1
#$ -cwd
#$ -j y
#$ -l h_vmem=12G
#$ -l h_rt=10:0:0

module load maker/2.31.9-mpi

OUTDIR=/data/scratch/btx316/Comp_Genomics/22_Maker_Annotation/01_Test
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/22_Maker_Annotation

cd $OUTDIR

export HMMER_NCPU=0
export AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/22_Maker_Annotation/Augustus-master/config

## Maker command to run on parallel cores
#mpiexec -np 8 maker maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl


## Maker command to run on a single core (run this first setting smp 1 and vmem=10G; just to check if you will get any errors)
## Also to make sure that it runs and it generates files correctly, you will need to check the log files and especially the 
## "XXX_master_datastore_index.log" This file is within the maker.output dir that will be created within your $OUTDIR.
## We can have a quick skype if you want and share me your screen to check these files. There is a chance that you will get
## no error but the annotation won't be running...
maker $SCRIPTS/maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl
