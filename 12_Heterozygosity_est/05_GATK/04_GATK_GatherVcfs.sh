#!/bin/bash
#$ -N GATK_GatherVCFs
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=5:00:00
#$ -l h_vmem=4G
#$ -t 1

module load gatk/4.1.6.0

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/03_GenotypeGVCFs
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/03_GenotypeGVCFs
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

date
echo ${SGE_TASK_ID}

gatk GatherVcfs \
  -I $DATA_DIR/All_Gy_chrI_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrIII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrIV_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrV_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrVI_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrVII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrVIII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrIX_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrX_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXI_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXIII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXIV_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXV_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXVI_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXVII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXVIII_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXIX_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXX_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrXXI_gynogenePELib_raw.vcf \
	-I $DATA_DIR/All_Gy_chrUn_gynogenePELib_raw.vcf \
  -O $OUT_DIR/All_Gy_pchrom_gynogenePELib_raw.vcf
  
  echo "Done"
