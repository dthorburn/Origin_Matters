#!/bin/bash
#$ -N X15_SURVIVOR_Merge_Failed
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=12:00:00
#$ -l h_vmem=6G
#$ -t 1

module load python/2.7.15
Genome="Gynogene"

DATA_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/10_Fixing_RGs/03_SVTyped
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/10_Fixing_RGs/04_Merged
Delly_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Dellys/"$Genome"
Merged_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/02_Merged_Calls/"$Genome"
TOOL=/data/home/btx316/privatemodules/SURVIVOR/Debug

for ID in BS40 BS42 BS53
do
  echo "Starting on "$ID": "`date`
  if [ $ID == "BS42" ]
  then
    chroms="Gy_chrXIV"
  else
    chroms="Gy_chrVII Gy_chrXIV"
  fi
  
  for chrom in ${chroms}
  do
    for file in `ls $DATA_DIR/"$ID"*"$chrom"*"GT.bam.vcf"`
    do
      echo "Removing missing genotypes from "$ID"-"$chrom": "`basename $file`
      ## Removing the 0/0 genotype calls
      newname=`basename $file | sed -e "s/GT.bam.vcf/NoMissing.GT.vcf/"`
      grep -vw "0/0" $file > $DATA_DIR/"$newname"
    done
    
    ## Getting the file list for merging
    ls -1 $DATA_DIR/"$ID"*"$chrom"*NoMissing.GT.vcf > X15_Failed_"$ID"_"$chrom".List
    
    ## Merging all calls; must be in 1 call, doesn't have to match type, or strand, and needs a minimum size of 1bp
    $TOOL/SURVIVOR merge X15_Failed_"$ID"_"$chrom".List 0 1 0 0 0 1 $OUT_DIR/"$ID"_Lumpy_SV_"$Genome"."$chrom".NoMissing.GT.vcf
    
    echo "RGs merged"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
    ls -1 $OUT_DIR/"$ID"_Lumpy_SV_"$Genome"."$chrom".NoMissing.GT.vcf > X15_"$ID"_"$chrom"_Files
    ls -1 $Delly_DIR/"$ID"_Delly_CNV_"$Genome"."$chrom".NoMissing.GT.vcf >> X15_"$ID"_"$chrom"_Files
    
    $TOOL/SURVIVOR merge X15_"$ID"_"$chrom"_Files 0.5 2 1 1 0 1000 $Merged_DIR/"$ID"_Both_SV_"$Genome"_"$chrom".NoMissing.GT.Merged.Masked.CNS.vcf
    echo "Calls merged"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  done
  echo "---------------------------------------------------------------------------------"
done

echo "All Done: "`date`