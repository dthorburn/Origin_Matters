#!/bin/bash
#$ -N Genome_Coverage_GynogenePELib
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=6:00:00
#$ -l h_vmem=8G

module load bedtools

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
OUTDIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/15_Heterozygosity_est/04_Picard_precall
REF=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

file=PELibs.cleaned.sorted.merged.gynogene.markdup.bam
out=PELibs.genomecov_summary_gynogene
final=PELibs.genomeonly.genomecov_summary_gynogene

bedtools genomecov -ibam $DATA_DIR/"$file" -g $REF/Gynogen_pchrom_assembly_all.txt > $OUTDIR/raw/"$out"

grep "genome" $OUTDIR/raw/"$out" > $OUTDIR/"$final"

echo "Done for "${SGE_TASK_ID}