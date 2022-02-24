#!/bin/sh
#$ -N Chromosemble_Satsuma2_Peichel_Resolved_TH
#$ -j Y
#$ -cwd
#$ -t 1
#$ -l node_type=nxv
#$ -pe smp 2
#$ -l h_rt=72:00:00
#$ -l h_vmem=12G

module load gcc/7.1.0
module load cmake/3.16.0

Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
Ref_Gynogene=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
Tool=/data/home/btx316/privatemodules/satsuma2/bin
OUT_DIR=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/00E_Chromosembl_Peichel_resolved_NoUn_TH
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/12_Satsuma2_Synteny

date
export SATSUMA2_PATH=~/privatemodules/satsuma2/bin
rm -r $OUT_DIR/*
mkdir $OUT_DIR
cd $OUT_DIR
$Tool/Chromosemble -n 10 -thorough 1 -q $Ref_Gynogene/Gynogen_PacBio_reference_updated.fasta -t $Ref_Peichel/Gac-HiC_revised_genome_assembly_noUn.fasta -o $OUT_DIR/
#-nomerge 1
echo "Done"
date