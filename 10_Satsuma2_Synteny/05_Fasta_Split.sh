#!/bin/bash
#$ -N Split_ChrUn
#$ -j Y
#$ -cwd
#$ -t 1
#$ -pe smp 1
#$ -l h_rt=1:00:00
#$ -l h_vmem=4G

module load python
module load samtools

Tool=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/12_Satsuma2_Synteny
Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Glazer_Genome
date

$Tool/05_Fasta_Split.py < $Ref_Peichel/Peichel_reference_chrUn.fasta > $Ref_Peichel/Peichel_reference_Unmapped.fasta
samtools faidx $Ref_Peichel/Peichel_reference_Unmapped.fasta
#Peichel_reference_Unmapped.fasta
echo "Done"
date