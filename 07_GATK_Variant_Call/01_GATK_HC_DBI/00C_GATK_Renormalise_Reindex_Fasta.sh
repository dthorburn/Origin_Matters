#!/bin/bash
#$ -N GATK_Normalise_Reindex
#$ -cwd
#$ -j y
#$ -l h_rt=6:00:00
#$ -l h_vmem=10G
#$ -t 1

module load gatk/4.1.6.0
module load samtools
module load bwa

REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
cd $REFERENCE
   
gatk NormalizeFasta \
  -I $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -O $REFERENCE/Gynogen_pchrom_assembly_all_Normalised.fasta

rm $REFERENCE/Gynogen_pchrom_assembly_all.fasta
mv $REFERENCE/Gynogen_pchrom_assembly_all_Normalised.fasta $REFERENCE/Gynogen_pchrom_assembly_all.fasta

## Indexing the references
bwa index $REFERENCE/Gynogen_pchrom_assembly_all.fasta
samtools faidx $REFERENCE/Gynogen_pchrom_assembly_all.fasta
gatk CreateSequenceDictionary \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta