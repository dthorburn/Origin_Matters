#!/bin/bash
#$ -N FastQC_All_Reads
#$ -j Y
#$ -cwd
#$ -t 1
#$ -pe smp 1 ## requesting 2 nodes
#$ -l h_rt=12:00:00
#$ -l h_vmem=10G

module load fastqc

DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Gynogen_assembly/02_Filtered_Data/Illumina_Q33
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/15_Heterozygosity_est/01_FastQC
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/03_FastQC

for file in 121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_1.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_2.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_1.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_2.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_1.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_2.fq.gz.clean.dup.clean.fastq.gz
do  
  echo $file
  fastqc -o $OUT_DIR/ $DATA_DIR/"$file" 
done
echo "All done"