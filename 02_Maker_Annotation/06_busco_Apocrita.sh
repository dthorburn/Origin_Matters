#!/bin/bash
#$ -N X06_BUSCO_Apocrita
#$ -o /data/SBCS-EizaguirreLab/Annotation/MyFourthRound/ChrAllnoM/busco/apocrita_MT
#$ -pe smp 10
#$ -cwd
#$ -j y
#$ -l h_vmem=6G
#$ -l h_rt=240:0:0

#Augustus training within busco
module load busco
module load augustus

echo "Starting BUSCO Run: "`date`

TRANSCRIPTS=/data/SBCS-EizaguirreLab/Annotation/MyFourthRound/ChrAllnoM/augustus/apocrita/Gy_allnoM_rd3.maker.transcripts1000.fasta
OUTDIR=/data/SBCS-EizaguirreLab/Annotation/MyFourthRound/ChrAllnoM/busco/apocrita_MT
LIBRARY=/data/archive/archive-SBCS-EizaguirreLab/Annotation/Gynogen_Annotation2020scratch/BUSCO/actinopterygii_odb9
AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config
cd $OUTDIR

export AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config
BUSCO.py -i $TRANSCRIPTS -o Gy_chrAllnoM_rd3.maker_apocrita -l $LIBRARY -m genome -c 10 --long -sp zebrafish -z --augustus_parameters='--progress=true'



echo "All Done: "`date`