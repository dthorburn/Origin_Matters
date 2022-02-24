#!/bin/bash
#$ -N GATK_Select_Variants
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=2:00:00
#$ -l h_vmem=4G
#$ -t 1

module load gatk/4.1.6.0

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/03_GenotypeGVCFs
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/04_SelectVariants
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

gatk SelectVariants \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V $DATA_DIR/All_Gy_pchrom_gynogenePELib_raw.vcf \
  -O $OUT_DIR/All_pchrom_gynogenePELib_rawSNPs.vcf \
  --select-type-to-include SNP
  
gatk SelectVariants \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V $DATA_DIR/All_Gy_pchrom_gynogenePELib_raw.vcf \
  -O $OUT_DIR/All_pchrom_gynogenePELib_rawINDELs.vcf \
  --select-type-to-include INDEL