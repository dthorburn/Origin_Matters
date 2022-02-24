#!/bin/bash
#$ -N GATK_FilteringVariants_Gynogene
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=2:00:00
#$ -l h_vmem=12G
#$ -t 1

module load gatk/4.1.6.0

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/04_SelectVariants
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome

gatk VariantFiltration \
  -V $DATA_DIR/All_pchrom_gynogenePELib_rawSNPs.vcf \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -O $DATA_DIR/All_pchrom_gynogenePELib_rawSNPs.scored.vcf \
  --filter-expression "QUAL < 30.0" \
  --filter-name FAIL_QUAL \
  --filter-expression "MQ < 40.0" \
  --filter-name FAIL_MQ \
  --filter-expression "SOR > 3.00" \
  --filter-name FAIL_SOR \
  --filter-expression "QD < 2.0" \
  --filter-name FAIL_QD \
  --filter-expression "FS > 60.0" \
  --filter-name FAIL_FS
  
echo "Done scoring variants"

gatk SelectVariants \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V $DATA_DIR/All_pchrom_gynogenePELib_rawSNPs.scored.vcf \
  -O $DATA_DIR/All_pchrom_gynogenePELib.SNPs.filtered.vcf \
  -select 'vc.isNotFiltered()'
  
echo "Finished fitlering"