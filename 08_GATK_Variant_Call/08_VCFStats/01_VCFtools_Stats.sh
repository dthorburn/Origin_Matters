#!/bin/bash
#$ -N X01_VCF_Summary
#$ -j y
#$ -cwd
#$ -t 1-2
#$ -l h_rt=3:00:00
#$ -l h_vmem=4G

#module load vcftools
module load bcftools

if [ ${SGE_TASK_ID} == 1 ]
then 
  Genome="Peichel"
  chr_prefix=""
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome="Gynogene"
  chr_prefix="Gy_"
fi

DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/01_VCFs/02_Filtered/"$Genome"
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/08_VCFStats/"$Genome"

chroms=("chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXX" "chrXXI")

for i in {1..19..1}
do
  echo "Starting on "${chroms["$i"]}
  bcftools stats -s- $DATA_DIR/All_"$chr_prefix""${chroms["$i"]}"_"${Genome,,}"_SNPs_Filtered_Selected.vcf.gz > $OUT_DIR/All_"$chr_prefix""${chroms["$i"]}"_"${Genome,,}".summary
  #vcf-stats $DATA_DIR/All_"$chr_prefix""$chroms"_"${Genome,,}"_SNPs_Filtered_Selected.vcf.gz > $OUT_DIR/All_"$chr_prefix""$chroms"_"${Genome,,}".summary
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

echo "All Done"