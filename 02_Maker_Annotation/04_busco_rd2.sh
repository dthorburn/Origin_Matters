#!/bin/bash
#$ -N X04_BUSCO_RD2
#$ -o /data/SBCS-EizaguirreLab/Annotation/MyThirdRound/ChrAllnoUnM/blast/busco/01_12Core_240H
#$ -pe smp 12
#$ -cwd
#$ -j y
#$ -l h_vmem=6G
#$ -l h_rt=240:0:0

module load busco
module load augustus

TRANSCRIPTS=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/ChrAllnoUnM/blast/augustus/Gy_allnoUnM_rd2.maker.transcripts1000.fasta
OUTDIR=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/ChrAllnoUnM/blast/busco/01_12Core_240H
LIBRARY=/data/archive/archive-SBCS-EizaguirreLab/Annotation/Gynogen_Annotation2020scratch/BUSCO/actinopterygii_odb9
AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config

echo "Starting BUSCO Run: "`date`

cd $OUTDIR
export AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config
BUSCO.py -i $TRANSCRIPTS -o Gy_chrAllnoUnM_rd2.maker_blast -l $LIBRARY -m genome -c 12 -f --long -sp zebrafish -z --augustus_parameters='--progress=true'

echo "All Done: "`date`