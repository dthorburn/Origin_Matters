#!/bin/bash
#$ -N X19_Summarise_SVCFs
#$ -j y
#$ -cwd
#$ -pe smp 1
#$ -l h_rt=4:00:00
#$ -l h_vmem=4G
#$ -t 1-40

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

ID_List=("EMPTY" "BS1" "BS2" "BS3" "BS4" "BS5" "BS6" "BS7" "BS8" "BS9" "BS10" "BS11" "BS12" "BS13" "BS14" "BS15" "BS16" "BS17" "BS18" "BS19" "BS20" "BS21" "BS22" "BS23" "BS24" "BS31" "BS32" "BS33" "BS34" "BS35" "BS36" "BS37" "BS38" "BS39" "BS40" "BS41" "BS42" "BS43" "BS44" "BS45" "BS46" "BS47" "BS48" "BS49" "BS50" "BS51" "BS52" "BS53" "BS54" "BS55" "BS56" "BS57" "BS58" "BS59" "BS60" "BS61" "BS62" "BS63" "BS64" "BS65" "BS66")

Ind_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/04_Cohort_Overlap_Separate/"$Genome"
TOOL=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/06_New_Pipeline_Whole

module load R/3.5.3

for i in {1..60..1}
do
  
  ## Removing the empty rows in the vcf
  grep -vw "\./\." $Ind_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.1kb.vcf > $Ind_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.1kb.NoMissing.vcf
  
  SVCF=$Ind_DIR/"${ID_List["$i"]}"_"$Genome"_"${Chr_List["$Chr_ID"]}"_Merged.Individual.0.5Over.1kb.NoMissing.vcf
  Output=`basename $SVCF | sed -e "s/_Merged.Individual.0.5Over.1kb.NoMissing.vcf/.NoDP.csv/"`
  
  Rscript $TOOL/19_Individual_Results_Parse.R $SVCF $Output
done
 
echo "All Done" 

