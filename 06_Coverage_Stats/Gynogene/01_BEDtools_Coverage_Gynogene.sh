#!/bin/bash
#$ -N Genome_Coverage_Gynogene
#$ -j y
#$ -cwd
#$ -t 1-66
#$ -l h_rt=6:00:00
#$ -l h_vmem=8G

module load bedtools

## Taken the MSMC pipeline from https://github.com/JackyHess/MSMC_analysis

## Creating the changable directories and filename to be submitted. ## Added/Unfinished to both OUTDIR and SCRIPTS
#DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/04_MarkDups
DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/04_MarkDups
#OUTDIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/02_Coverage_Analysis/Peichel
OUTDIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/02_Coverage_Analysis/Gynogene
#REF=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REF=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

#file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.peichel.markdup.bam
file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.gynogene.markdup.bam
#out=BS"${SGE_TASK_ID}".genomecov_summary_peichel
out=BS"${SGE_TASK_ID}".genomecov_summary_gynogene
#final=BS"${SGE_TASK_ID}"_genomeonly.genomecov_summary_peichel
final=BS"${SGE_TASK_ID}"_genomeonly.genomecov_summary_gynogene

#bedtools genomecov -ibam $DATA_DIR/"$file" -g $REF/HiC_revised_genome_assembly_lens.txt > $OUTDIR/raw/"$out"
bedtools genomecov -ibam $DATA_DIR/"$file" -g $REF/Gynogen_pchrom_assembly_all.txt > $OUTDIR/raw/"$out"

grep "genome" $OUTDIR/raw/"$out" > $OUTDIR/"$final"

echo "Done for "${SGE_TASK_ID}