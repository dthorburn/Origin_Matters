#!/bin/bash
#$ -N X18_SURVIVOR_Merge_Cohort
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=2:00:00
#$ -l h_vmem=12G
#$ -t 1-40

module load python/2.7.15
module load vcftools

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

SURVIVOR=/data/home/btx316/privatemodules/SURVIVOR/Debug
Merged_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/02_Merged_Calls/"$Genome"
Sorted_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/03_Merged_Cohort_Calls/01_Sorted_Input_Inds/"$Genome"
Cohort_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/03_Merged_Cohort_Calls/"$Genome"

ID_List=("EMPTY" "BS1" "BS2" "BS3" "BS4" "BS5" "BS6" "BS7" "BS8" "BS9" "BS10" "BS11" "BS12" "BS13" "BS14" "BS15" "BS16" "BS17" "BS18" "BS19" "BS20" "BS21" "BS22" "BS23" "BS24" "BS31" "BS32" "BS33" "BS34" "BS35" "BS36" "BS37" "BS38" "BS39" "BS40" "BS41" "BS42" "BS43" "BS44" "BS45" "BS46" "BS47" "BS48" "BS49" "BS50" "BS51" "BS52" "BS53" "BS54" "BS55" "BS56" "BS57" "BS58" "BS59" "BS60" "BS61" "BS62" "BS63" "BS64" "BS65" "BS66")

## Coordinate sorting the input files
for i in {1..60..1}
do
  echo "Sorting "${Chr_List["$Chr_ID"]}" "${ID_List["$i"]}": "`date`
  input=$Merged_DIR/"${ID_List["$i"]}"_Both_SV_"$Genome"_"${Chr_List["$Chr_ID"]}".NoMissing.GT.Merged.Masked.vcf
  newname=`basename $input | sed -e "s/.vcf/.Sorted.vcf/"`
  vcf-sort $input > $Sorted_DIR/"$newname"
done

## Generating the list of files to be included in each combination. 
ls -1 $Sorted_DIR/BS*_Both_SV_"$Genome"_"${Chr_List["$Chr_ID"]}".NoMissing.GT.Merged.Masked.Sorted.vcf > X18_"${Chr_List["$Chr_ID"]}"_"$Genome"_Files
  
## 0.5 proportional reciprocal overlap, 2 callers must agree, binary yes for agree on SV type, no for strand, and disabled, then minimum size
$SURVIVOR/SURVIVOR merge X18_"${Chr_List["$Chr_ID"]}"_"$Genome"_Files 0.5 1 1 0 0 1000 $Cohort_DIR/All_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.0.5Over.1kb.vcf
echo "Finished merging cohort of "$Genome" "${Chr_List["$Chr_ID"]}": "`date`
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

module purge
module load gatk/4.1.6.0
module load R/3.5.3

Ind_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/04_Cohort_Overlap_Separate/"$Genome"
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/"$Genome"_Genome/Ind_Chroms
TOOL=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/06_New_Pipeline_Whole

DUPHOLD=/data/home/btx316/privatemodules/Duphold
BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/06_RGUpdate
SNP_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/05_Filtering
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/05_Individual_Duphold/"$Genome"

for i in {1..60..1}
do
  gatk SelectVariants \
    -R $REFERENCE/"$Genome"_Reference_Masked.fasta \
    -V $Cohort_DIR/All_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.0.5Over.1kb.vcf \
    -O $Ind_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.1kb.vcf \
    -select 'vc.isNotFiltered()' \
    -sn ${ID_List["$i"]}
  
  ## Annotating SVs based on coverage and on SNPs
  $DUPHOLD/duphold -t 1 \
    -v $Ind_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.1kb.vcf \
    -b $BAM_DIR/"${ID_List["$i"]}".cleaned.sorted.merged."${Genome,,}".markdup.RGUpdate.bam \
    -f $REFERENCE/"$Genome"_Reference_Masked.fasta \
    -s $SNP_DIR/All_"$Genome"_Autosome_Filtered_Selected.bcf.gz \
    -o $OUT_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.DPAnnot.1kb.vcf
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  
  ## Removing the empty rows in the vcf
  grep -vw "\./\." $OUT_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.DPAnnot.1kb.vcf > $OUT_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.DPAnnot.1kb.NoMissing.vcf
  
  SVCF=$OUT_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.DPAnnot.1kb.NoMissing.vcf
  Output=`basename $SVCF | sed -e "s/_Merged.Individual.0.5Over.DPAnnot.1kb.NoMissing.vcf/.csv/"`
  
  Rscript $TOOL/17_Summararise_SVCF.R $SVCF $Output
done
 
echo "All Done" 