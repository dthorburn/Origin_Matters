#!/bin/bash
#$ -N BlockDisplaySatsuma_Contig_Level
#$ -j Y
#$ -cwd
#$ -t 1
#$ -l node_type=nxv
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gcc/7.1.0
module load cmake/3.16.0

Tool=/data/home/btx316/privatemodules/satsuma2/bin
Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#Ref_Gynogene=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
Ref_Gynogene=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/00_Chromosembl_NoMerge_Thorough
DATA_DIR=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/01_All_PChrom_Satsuma_NM_TH
OUT_DIR=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/03_Visualise

date
export SATSUMA2_PATH=~/privatemodules/satsuma2/bin

#rm $OUT_DIR/*
cd $OUT_DIR

$Tool/BlockDisplaySatsuma -i $DATA_DIR/satsuma_summary.chained.out -q $Ref_Gynogene/renamed_pseudochromosomes.fasta -t $Ref_Peichel/Gac-HiC_revised_genome_assembly.fasta > $OUT_DIR/gasAcu1_v_gynogene_NM_TH.out

echo "Done"
date