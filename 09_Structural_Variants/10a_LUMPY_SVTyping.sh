#!/bin/bash
#$ -N X10a_LUMPY_Genotyping
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=06:00:00
#$ -l h_vmem=4G
#$ -t 1-1200

## Loading the LumpyAnalysis python environment
module load python/2.7.15
source /data/home/btx316/LumpyAnalysis/bin/activate

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 1200 ]
then 
  Genome="Gynogene"
  chr_prefix="Gy_"
  New_Task_ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 1201 ]
then
  Genome="Peichel"
  chr_prefix=""
  New_Task_ID=`expr ${SGE_TASK_ID} - 1200`
fi

## Finding the task ID that is divisible by 60 to accurately apply the right chromosome. 
chrom=`echo $(( New_Task_ID / 60 ))`

## Ensuring all the IDs and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 60 ]
then 
  ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 61 ]
then
  ## Removing all the multiples of 60
  TASKS_RM=`expr $chrom \* 60`
  ID=`expr ${SGE_TASK_ID} - $TASKS_RM`
fi

ID_List=("BS66" "BS1" "BS2" "BS3" "BS4" "BS5" "BS6" "BS7" "BS8" "BS9" "BS10" "BS11" "BS12" "BS13" "BS14" "BS15" "BS16" "BS17" "BS18" "BS19" "BS20" "BS21" "BS22" "BS23" "BS24" "BS31" "BS32" "BS33" "BS34" "BS35" "BS36" "BS37" "BS38" "BS39" "BS40" "BS41" "BS42" "BS43" "BS44" "BS45" "BS46" "BS47" "BS48" "BS49" "BS50" "BS51" "BS52" "BS53" "BS54" "BS55" "BS56" "BS57" "BS58" "BS59" "BS60" "BS61" "BS62" "BS63" "BS64" "BS65" "BS66")
Chr_List=("chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXX" "chrXXI")

BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
DATA_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/02_LumpyExpress_Output/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Lumpys/"$Genome"

cd $OUT_DIR

## Running each sample against the bam file with it's reads
echo "Starting genotyping "$Genome" "${ID_List["$ID"]}" "${Chr_List["$chrom"]}": "`date`
svtyper \
    --verbose \
    -B $BAM_DIR/"${ID_List["$ID"]}".cleaned.sorted.merged."${Genome,,}".markdup.bam \
    -i $DATA_DIR/"${ID_List["$ID"]}"_Lumpy_CNV_"$Genome"."$chr_prefix""${Chr_List["$chrom"]}".bam.vcf \
    > $OUT_DIR/"${ID_List["$ID"]}"_Lumpy_SV_"$Genome"."$chr_prefix""${Chr_List["$chrom"]}"_.Raw.GT.vcf

echo "Finished genotyping "$Genome" "${ID_List["$ID"]}" "$chr_prefix""${Chr_List["$chrom"]}": "`date`
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"