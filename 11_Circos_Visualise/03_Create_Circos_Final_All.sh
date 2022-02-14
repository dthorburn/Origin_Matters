#!/bin/bash
#$ -N Circos_Plot_Resolved_All
#$ -j Y
#$ -cwd
#$ -t 1
#$ -pe smp 1
#$ -l h_rt=0:30:00
#$ -l h_vmem=6G

module load perl/5.26.0

DATA_DIR=/data/home/btx316/privatemodules/circos-0.69-9
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/13_Circos_Visualise
cd $DATA_DIR

./bin/circos -v
./bin/circos -conf $OUT_DIR/circos.resolved_chrUn.conf

mv /data/home/btx316/privatemodules/circos-0.69-9/circos_all_0.99_1kb.png /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/13_Circos_Visualise/Plots/

echo "All done with Circos"