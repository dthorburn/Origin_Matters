#!/bin/bash
#$ -N X01_bed2faa
#$ -cwd
#$ -j y
#$ -l h_rt=1:00:00
#$ -l h_vmem=6G

module load bedtools
module load emboss

Feature_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/23_OrthoFinder/01_Annotations
Reference_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

echo "Starting: "`date`

bedtools getfasta -s -split -name -fi $Reference_DIR/Gynogen_pchrom_assembly_all.fasta -bed $Feature_DIR/Gy_allnoUnM_rd4.maker.noseq.bed > $Feature_DIR/Gy_allnoUnM_rd4.maker.noseq.fasta

echo "Extracted DNA Sequences"

transeq -sequence $Feature_DIR/Gy_allnoUnM_rd4.maker.noseq.fasta -outseq $Feature_DIR/Gy_allnoUnM_rd4.maker.noseq.faa

echo "All done: "`date`