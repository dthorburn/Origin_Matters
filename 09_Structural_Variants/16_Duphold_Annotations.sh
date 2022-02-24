#!/bin/bash
#$ -N X16_SURVIVOR_Merge_Individuals
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#$ -t 1-3

ID_List=("BS66" "BS1" "BS2" "BS3" "BS4" "BS5" "BS6" "BS7" "BS8" "BS9" "BS10" "BS11" "BS12" "BS13" "BS14" "BS15" "BS16" "BS17" "BS18" "BS19" "BS20" "BS21" "BS22" "BS23" "BS24" "BS31" "BS32" "BS33" "BS34" "BS35" "BS36" "BS37" "BS38" "BS39" "BS40" "BS41" "BS42" "BS43" "BS44" "BS45" "BS46" "BS47" "BS48" "BS49" "BS50" "BS51" "BS52" "BS53" "BS54" "BS55" "BS56" "BS57" "BS58" "BS59" "BS60" "BS61" "BS62" "BS63" "BS64" "BS65" "BS66")

## Extracting the relevant information from the file name
if [ ${SGE_TASK_ID} -le 60 ]
then 
  Genome="Peichel"
  ID=${SGE_TASK_ID}
  Chr_List="chrI chrII chrIII chrIV chrV chrVI chrVII chrVIII chrIX chrX chrXI chrXII chrXIII chrXIV chrXV chrXVI chrXVII chrXVIII chrXX chrXXI"
elif [ ${SGE_TASK_ID} -ge 61 ]
then
  ID=`expr ${SGE_TASK_ID} - 60`
  Genome="Gynogene"
  Chr_List="Gy_chrI Gy_chrII Gy_chrIII Gy_chrIV Gy_chrV Gy_chrVI Gy_chrVII Gy_chrVIII Gy_chrIX Gy_chrX Gy_chrXI Gy_chrXII Gy_chrXIII Gy_chrXIV Gy_chrXV Gy_chrXVI Gy_chrXVII Gy_chrXVIII Gy_chrXX Gy_chrXXI"
fi

## Setting the appropriate directories
#BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/06_RGUpdate
SNP_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/05_Filtering
DATA_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/02_Merged_Calls/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/03_Sorted_Annotated/"$Genome"
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/"$Genome"_Genome/Ind_Chroms
TOOL=/data/home/btx316/privatemodules/Duphold

for chrom in ${Chr_List}
do
  echo "Starting on "${ID_List["$ID"]}"-"$chrom": "`date`
  SVCF=$DATA_DIR/BS"$ID"_Both_SV_"$Genome"_"$chrom".NoMissing.GT.Merged.Masked.vcf
  echo $SVCF
  Newname=`basename $SVCF | sed -e "s/GT.vcf/DPAnnot.GT.vcf/"`
  Filter_name=`basename $SVCF | sed -e "s/GT.vcf/Filtered.DPAnnot.GT.vcf/"`
  Final_name=`basename $SVCF | sed -e "s/Raw.0.5OvLap.GT.vcf/Filtered.DPAnnot.GT.vcf/"`
  
  ## Annotating SVs based on coverage and on SNPs
  $TOOL/duphold -t 1 \
    -v $SVCF \
    -b $BAM_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.RGUpdate.bam \
    -f $REFERENCE/"$Genome"_Reference_Masked.fasta \
    -s $SNP_DIR/All_"$Genome"_Autosome_Filtered_Selected.bcf.gz \
    -o $OUT_DIR/"$Newname"
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

echo "All Done"