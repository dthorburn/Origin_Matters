#!/bin/bash
#$ -N X17_Summarise_Inds_SVCFs
#$ -cwd
#$ -j y
#$ -l h_rt=8:00:00
#$ -l h_vmem=4G
#$ -t 1-2400

if [ ${SGE_TASK_ID} -le 20 ]
then 
  Genome="Peichel"
  Chr_ID=${SGE_TASK_ID}
  Chr_List=("EMPTY" "chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXX" "chrXXI")
elif [ ${SGE_TASK_ID} -ge 21 ]
then
  Chr_ID=`expr ${SGE_TASK_ID} - 20`
  Genome="Gynogene"
  Chr_List=("EMPTY" "Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVII" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXIV" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
fi

module load R/3.5.3

DATA_DIR
OUT_DIR

SVCF=`sed ${SGE_TASK_ID}"q;d" /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/04_Whole_Pipeline/11C_VCF_Ind_Files.txt`
Output=`basename $SVCF | sed -e "s/.Filtered.DPAnnot.GT.vcf/.csv/"`
Rscript /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/04_Whole_Pipeline/11B_Summary_SVCF_Inds.R $SVCF $Output

