#!/bin/bash
#$ -N Satsuma2_Synteny_All_Filtered_Run1
#$ -j Y
#$ -cwd
#$ -t 1
#$ -l node_type=nxv
#$ -pe smp 2
#$ -l h_rt=48:00:00
#$ -l h_vmem=10G

module load gcc/7.1.0
module load cmake/3.16.0

Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#Ref_Gynogene=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
#Ref_Gynogene=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/00_Chromosembl3
Ref_Gynogene=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/00_Chromosembl_Peichel_Resolved_Misassembled
Tool=/data/home/btx316/privatemodules/satsuma2/bin
OUT_DIR=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/01E_All_PChrom_Filtered_Run1

date
export SATSUMA2_PATH=~/privatemodules/satsuma2/bin

mkdir $OUT_DIR
rm $OUT_DIR/*
cd $OUT_DIR

$Tool/SatsumaSynteny2 -km_mem 30 -sl_mem 4 -slaves 12 -threads 1 -q $Ref_Gynogene/Gynogen_pchrom_assembly_all.fasta -t $Ref_Peichel/Gac-HiC_revised_genome_assembly.fasta -o $OUT_DIR

echo "Done"
date