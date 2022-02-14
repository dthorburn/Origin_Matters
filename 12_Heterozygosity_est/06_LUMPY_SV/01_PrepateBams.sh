#!/bin/bash
#$ -N Lumpy_Process_Bams_GynogenePEleb
#$ -j y
#$ -cwd
#$ -l h_rt=2:00:00
#$ -l h_vmem=8G

module load samtools
module load python/3.6.3

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/01_SplittingBams
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/01_Prepare_Bams/Peichel

## This pipeline is taken from: https://github.com/arq5x/lumpy-sv#lumpy-traditional-usage
## Getting the discordant reads first
samtools view -b -F 1294 $DATA_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.bam | samtools sort > $OUT_DIR/PELibs.discordant.bam
echo "Discordant alignment extracted"

## Getting the split-read alignments
samtools view -h $DATA_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.bam \
    | python $SCRIPTS/extractSplitReads_BwaMem -i stdin \
    | samtools view -Sb - \
    | samtools sort > $OUT_DIR/PELibs.splitters.bam

echo "Done"