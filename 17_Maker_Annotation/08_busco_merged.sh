#!/bin/bash
#$ -N X08_BUSCO_AZURE
#$ -o /data/SBCS-EizaguirreLab/Annotation/MyFourthRound/ChrAllnoM/busco/Merged_MT
#$ -pe smp 6
#$ -cwd
#$ -j y
#$ -l h_vmem=6G
#$ -l h_rt=24:0:0

echo "Starting BUSCO Run: "`date`

#Augustus training within busco
module load busco
module load augustus


OUTDIR=/data/SBCS-EizaguirreLab/Annotation/MyFourthRound/ChrAllnoM/busco/Merged_MT
TRANSCRIPTS=/data/SBCS-EizaguirreLab/Annotation/Functional/finals/merged/maker_with_interpro_merged.sorted_nodupl.transcripts.fasta
LIBRARY=/data/archive/archive-SBCS-EizaguirreLab/Annotation/Gynogen_Annotation2020scratch/BUSCO/actinopterygii_odb9
AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config
cd $OUTDIR

export AUGUSTUS_CONFIG_PATH=/data/SBCS-EizaguirreLab/Annotation/MyThirdRound/Maker_round3/Augustus-master/config
BUSCO.py -i $TRANSCRIPTS -o Gy_chrAllnoM_final_merged -l $LIBRARY -m genome -c 6 -sp zebrafish -z --augustus_parameters='--progress=true'


echo "All Done: "`date`