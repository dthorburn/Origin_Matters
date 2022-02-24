#!/bin/bash
#$ -N SVtyper_PELibs
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=48:00:00
#$ -l h_vmem=10G

BAM_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/02_LumpyExpress
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/02_LumpyExpress
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

module load python/2.7.15
source /data/home/btx316/LumpyAnalysis/bin/activate
svtyper \
    -B $BAM_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.bam \
    -i $DATA_DIR/PELibs_Lumpy_SV.sorted.merged.bam.vcf \
    -T $REFERENCE/Gynogen_pchrom_assembly_all.fast \
    -o $OUT_DIR/PELibs_Lumpy_SV.GT.vcf \
    --verbose