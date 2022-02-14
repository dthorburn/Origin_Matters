#!/bin/bash
#$ -N X03_ParseVCFs
#$ -j Y
#$ -cwd
#$ -t 6-10
#$ -pe smp 1 ## requesting 2 nodes
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G

module load python/3.6.3

if [ ${SGE_TASK_ID} -le 5 ]
then
  Genome="Peichel"
  Task=${SGE_TASK_ID}
  chr_prefix=""
elif [ ${SGE_TASK_ID} -ge 6 ]
then
  Genome="Gynogene"
  Task=`expr ${SGE_TASK_ID} - 5`
  chr_prefix="Gy_"
fi

TOOL=/data/home/btx316/privatemodules/genomics_general
DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/01_VCFs/02_Filtered/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/21_Dxy_Scan/01_Geno_Files/"$Genome"
FINAL_OUT=/data/scratch/btx316/Comp_Genomics/21_Dxy_Scan/02_Scans/"$Genome"

if [ $Task = 1 ]; then pop1="G1_R"; tracks1=("1" "3" "5" "7" "9" "11"); fi
if [ $Task = 1 ]; then pop2="G1_L"; tracks2=("2" "4" "6" "8" "10" "12"); fi
if [ $Task = 2 ]; then pop1="G2_R"; tracks1=("13" "15" "17" "19" "21" "23"); fi
if [ $Task = 2 ]; then pop2="G2_L"; tracks2=("14" "16" "18" "20" "22" "24"); fi
if [ $Task = 3 ]; then pop1="US_R"; tracks1=("31" "33" "35" "37" "39" "41"); fi
if [ $Task = 3 ]; then pop2="US_L"; tracks2=("32" "34" "36" "38" "40" "42"); fi
if [ $Task = 4 ]; then pop1="CA_R"; tracks1=("43" "45" "47" "49" "51" "53"); fi
if [ $Task = 4 ]; then pop2="CA_L"; tracks2=("44" "46" "48" "50" "52" "54"); fi
if [ $Task = 5 ]; then pop1="NO_R"; tracks1=("55" "57" "59" "61" "63" "65"); fi
if [ $Task = 5 ]; then pop2="NO_L"; tracks2=("56" "58" "60" "62" "64" "66"); fi

Pair=`echo $pop1 | sed -e "s/_.//"`

for i in I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XX XXI
do
  VCF=$DATA_DIR/All_"$chr_prefix"chr"$i"_${Genome,,}_SNPs_Filtered_Selected.vcf.gz
  GENO=$OUT_DIR/"$Pair"_"$chr_prefix"chr"$i"_${Genome,,}_SNPs_Filtered_Selected.geno
  FINAL=$FINAL_OUT/"$Pair"_"$chr_prefix"chr"$i"_${Genome,,}_SNPs_Filtered_Selected.DXY.csv.gz
  
  ## Converting vcf to geno file type
  $TOOL/VCF_processing/parseVCF.py -i $VCF -o $GENO
  echo "Conversion complete"
  
  $TOOL/popgenWindows.py -g $GENO -o $FINAL \
    -f phased -w 20000 -m 10 -s 20000 -T 1 --verbose --addWindowID --writeFailedWindows \
    -p $pop1 BS"${tracks1[0]}",BS"${tracks1[1]}",BS"${tracks1[2]}",BS"${tracks1[3]}",BS"${tracks1[4]}",BS"${tracks1[5]}" \
    -p $pop2 BS"${tracks2[0]}",BS"${tracks2[1]}",BS"${tracks2[2]}",BS"${tracks2[3]}",BS"${tracks2[4]}",BS"${tracks2[5]}"
  
  echo "Calculations done"
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done