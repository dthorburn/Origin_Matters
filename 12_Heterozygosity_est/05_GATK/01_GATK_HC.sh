#!/bin/bash
#$ -N GATK_HC_GynogenePElib_4160
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=24:00:00
#$ -l h_vmem=8G
#$ -t 1

#module load singularity
module load gatk/4.1.6.0

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
OUTDIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/01_HC
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

file=PELibs.cleaned.sorted.merged.gynogene.markdup.bam
echo $file

newname=`basename $file | sed -e "s/.bam/.4160.g.vcf/"`
echo $newname

CONTAINERS=/data/SBCS-Informatics/singularity/images
##   
#singularity exec $CONTAINERS/gatk-4.img \
#  /opt/gatk/gatk HaplotypeCaller  \
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