#!/bin/bash
#$ -N X11_SURVIVOR_Merge_Individuals_Fixed
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=12:00:00
#$ -l h_vmem=18G
#$ -t 107

module load python/2.7.15

## Finding the task ID that is divisible by 60 to accurately apply the right chromosome. 
chrom=`echo $(( SGE_TASK_ID / 60 ))`

if [ ${SGE_TASK_ID} -le 60 ]
then 
  Genome="Peichel"
  ID=${SGE_TASK_ID}
  Chr_List=("chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXX" "chrXXI")
elif [ ${SGE_TASK_ID} -ge 61 ]
then
  ## Removing all the multiples of 60
  TASKS_RM=`expr $chrom \* 60`
  ID=`expr ${SGE_TASK_ID} - $TASKS_RM`
  Genome="Gynogene"
  Chr_List=("Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVII" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXIV" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
  if [ $ID == 34 ]
  then
  ## BS40
    Chr_List=("Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
  elif [ $ID == 36 ]
  then
  ## BS42
    Chr_List=("Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVII" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
  elif [ $ID == 47 ]
  then
  ## BS53
    Chr_List=("Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
  fi
fi

ID_List=("BS66" "BS1" "BS2" "BS3" "BS4" "BS5" "BS6" "BS7" "BS8" "BS9" "BS10" "BS11" "BS12" "BS13" "BS14" "BS15" "BS16" "BS17" "BS18" "BS19" "BS20" "BS21" "BS22" "BS23" "BS24" "BS31" "BS32" "BS33" "BS34" "BS35" "BS36" "BS37" "BS38" "BS39" "BS40" "BS41" "BS42" "BS43" "BS44" "BS45" "BS46" "BS47" "BS48" "BS49" "BS50" "BS51" "BS52" "BS53" "BS54" "BS55" "BS56" "BS57" "BS58" "BS59" "BS60" "BS61" "BS62" "BS63" "BS64" "BS65" "BS66")

TOOL=/data/home/btx316/privatemodules/SURVIVOR/Debug

Lumpy_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Lumpys/"$Genome"
Delly_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Dellys/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/02_Merged_Calls/"$Genome"

for i in {0..0..1}
do
  echo "Starting analysis of "$Genome"."${Chr_List["$i"]}": "`date`
  ## Removing any variant with a 0/0 genotype in the Lumpy call
  grep -vw "0/0" $Lumpy_DIR/"${ID_List["$ID"]}"_Lumpy_SV_"$Genome"."${Chr_List["$i"]}"_.Raw.GT.vcf > $Lumpy_DIR/"${ID_List["$ID"]}"_Lumpy_SV_"$Genome"."${Chr_List["$i"]}".NoMissing.GT.vcf
  grep -vw "0/0" $Delly_DIR/"${ID_List["$ID"]}"_Delly_CNV_"$Genome"."${Chr_List["$i"]}".Filtered.GT.vcf > $Delly_DIR/"${ID_List["$ID"]}"_Delly_CNV_"$Genome"."${Chr_List["$i"]}".NoMissing.GT.vcf

  ## Generating the list of files to be included in each combination. 
  ls -1 $Delly_DIR/"${ID_List["$ID"]}"_Delly_CNV_"$Genome"."${Chr_List["$i"]}".NoMissing.GT.vcf > X11_"${ID_List["$ID"]}"_"$Genome"_Files
  ls -1 $Lumpy_DIR/"${ID_List["$ID"]}"_Lumpy_SV_"$Genome"."${Chr_List["$i"]}".NoMissing.GT.vcf >>  X11_"${ID_List["$ID"]}"_"$Genome"_Files
  
  ## 0.5 proportional reciprocal overlap, 2 callers must agree, binary yes for agree on SV type, no for strand, and disabled, then minimum size
  $TOOL/SURVIVOR merge X11_"${ID_List["$ID"]}"_"$Genome"_Files 0.5 2 1 0 0 1000 $OUT_DIR/"${ID_List["$ID"]}"_Both_SV_"$Genome"_"${Chr_List["$i"]}".NoMissing.GT.Merged.Masked.vcf
  echo "Finished analysis of "$Genome"."${Chr_List["$i"]}": "`date`
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done
echo "All done"
  
