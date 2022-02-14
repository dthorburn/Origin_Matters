#!/bin/bash
#$ -N Processing_Ref_Gens
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=2:00:00
#$ -l h_vmem=4G

module load python/2.7.15

## Adapted from https://github.com/JackyHess/MSMC_analysis

REF_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REF_Gynogen=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

#python /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/07_Coverage_Stats/get_sequence_lengths.py $REF_Peichel/Gac-HiC_revised_genome_assembly.fasta $REF_Peichel/HiC_revised_genome_assembly_lens.txt

python /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/07_Coverage_Stats/get_sequence_lengths.py $REF_Gynogen/Gynogen_pchrom_assembly_all.fasta $REF_Gynogen/Gynogen_pchrom_assembly_all.txt
