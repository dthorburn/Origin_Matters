#!/bin/bash
#$ -N X01_bed2faa
#$ -cwd
#$ -j y
#$ -l h_rt=1:00:00
#$ -l h_vmem=6G

module load bedtools
module load emboss

Feature_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/23_OrthoFinder/01_Annotations
Reference_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome

echo "Starting: "`date`

bedtools getfasta -s -split -name -fi $Reference_DIR/Gac-HiC_revised_genome_assembly.fasta -bed $Feature_DIR/Gasterosteus_aculeatus.BROADS1.95.toHic.bed > $Feature_DIR/Gasterosteus_aculeatus.BROADS1.95.toHic.fasta

echo "Extracted DNA Sequences"

transeq -sequence $Feature_DIR/Gasterosteus_aculeatus.BROADS1.95.toHic.fasta -outseq $Feature_DIR/Gasterosteus_aculeatus.BROADS1.95.toHic.faa

echo "All done: "`date`