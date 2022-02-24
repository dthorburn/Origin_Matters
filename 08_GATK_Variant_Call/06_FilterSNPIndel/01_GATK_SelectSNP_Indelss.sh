#!/bin/bash
#$ -N GATK_SelectSNP_Indels_Gynogene
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=16:00:00
#$ -l h_vmem=12G
#$ -t 1-1904

module load singularity
module load gatk

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Gynogene
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/06_SNPs_Indels/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/06_SNPs_Indels/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
CONTAINERS=/data/SBCS-Informatics/singularity/images
SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI

contig_num=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_gynogene.txt`
input_file=$DATA_DIR/All_"$contig_num"_gynogene_raw.vcf
newname=All_"$contig_num"_gynogene_SNPs_Indels_Filtered.vcf

echo ${SGE_TASK_ID}

gzip -d $input_file.gz

## $REFERENCE/Gynogen_PacBio_reference.fasta 
## --allow-old-rms-mapping-quality-annotation-data \
singularity exec $CONTAINERS/gatk-4.img \
  /opt/gatk/gatk VariantFiltration \
  -R $REFERENCE/Gynogen_PacBio_reference.fasta \
  -V $input_file \
  -O $OUTDIR/temp_step/"$newname" \
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
  
echo "Filtering step done"

filtered_file=$OUTDIR/temp_step/All_"$contig_num"_gynogene_SNPs_Indels_Filtered.vcf
newname2=`basename $filtered_file | sed -e "s/_Filtered.vcf/_Filtered_Selected.vcf/"`

singularity exec $CONTAINERS/gatk-4.img \
  /opt/gatk/gatk SelectVariants \
  -R $REFERENCE/Gynogen_PacBio_reference.fasta \
  -V $filtered_file \
  -O $OUTDIR/"$newname2" \
  -select 'vc.isNotFiltered()'

echo "Done"