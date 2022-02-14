#!/bin/bash
#$ -N GATK_HC_Gynogene_BS
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=60:00:00
#$ -l h_vmem=10G
#$ -t 1-66

module load gatk

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/05_RGUpdate
DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/05_RGUpdate
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/01_HC/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/01_HC/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

#file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.peichel.markdup.RGUpdate.bam
file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.gynogene.markdup.RGUpdate.bam
echo $file

newname=`basename $file | sed -e "s/.bam/.g.vcf/"`
echo $newname
##   
gatk HaplotypeCaller  \
  -ERC GVCF \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -I $DATA_DIR/"$file" \
  -A RMSMappingQuality \
  -A QualByDepth \
  -A FisherStrand \
  -A StrandOddsRatio \
  -O $OUTDIR/"$newname"
date