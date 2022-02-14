#!/bin/bash
#$ -N LumpyExpress_PELib
#$ -j y
#$ -cwd
#$ -t 1
#$ -l node_type=nxv
#$ -l h_rt=6:00:00
#$ -l h_vmem=20G

module load singularity

BAM_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/03_Picard_Cleaning/04_Markdups
SPLIT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/01_SplittingBams
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/05_LUMPY/02_LumpyExpress
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

cd $OUT_DIR

singularity exec /data/containers/lumpy/0.3.0/centos7-lumpy-0.3.0.img \
    lumpyexpress -k -P \
    -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
    -B $BAM_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.bam \
  	-S $SPLIT_DIR/PELibs.splitters.bam \
  	-D $SPLIT_DIR/PELibs.discordant.bam \
    -o $OUT_DIR/PELibs_Lumpy_SV.bam.vcf

echo "Finished with LumpyExpress"

module load python/2.7.15
source /data/home/btx316/LumpyAnalysis/bin/activate
svtyper \
    -B $BAM_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.bam \
  	-S $SPLIT_DIR/PELibs.splitters.bam \
    -i $OUT_DIR/PELibs_Lumpy_SV.bam.vcf \
    > $OUT_DIR/PELibs_Lumpy_SV.GT.vcf
   
echo "Finished with SVTyper"
