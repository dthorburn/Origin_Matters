#!/bin/bash
#$ -N X01_GATK_RandomSample
#$ -cwd
#$ -j y
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#$ -t 1-2

module load gatk/4.1.6.0

if [ ${SGE_TASK_ID} == 1 ]
then
  Genome=Peichel
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome/Gac-HiC_revised_genome_assembly.fasta
  Contigs=("EMPTY" "chrI" "chrII" "chrIII" "chrIV" "chrV" "chrVI" "chrVII" "chrVIII" "chrIX" "chrX" "chrXI" "chrXII" "chrXIII" "chrXIV" "chrXV" "chrXVI" "chrXVII" "chrXVIII" "chrXX" "chrXXI")
  Lengths=("EMPTY" "713" "570" "427" "821" "374" "452" "740" "494" "501" "433" "424" "499" "499" "388" "417" "469" "486" "383" "491" "419")
  Chr_prefix=""
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome=Gynogene
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/Gynogen_pchrom_assembly_all.fasta
  Contigs=("EMPTY" "Gy_chrI" "Gy_chrII" "Gy_chrIII" "Gy_chrIV" "Gy_chrV" "Gy_chrVI" "Gy_chrVII" "Gy_chrVIII" "Gy_chrIX" "Gy_chrX" "Gy_chrXI" "Gy_chrXII" "Gy_chrXIII" "Gy_chrXIV" "Gy_chrXV" "Gy_chrXVI" "Gy_chrXVII" "Gy_chrXVIII" "Gy_chrXX" "Gy_chrXXI")
  Lengths=("EMPTY" "724" "588" "438" "832" "387" "466" "730" "453" "542" "402" "435" "478" "511" "393" "429" "473" "501" "387" "472" "359")
  Chr_prefix="Gy_"
fi

DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/01_VCFs/02_Filtered/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/20_Phylogeny/01_RandomSNPs/"$Genome"

## A loop to extract 0.1% of all SNPs from each contig. Not too far from the number in the vectors above.  
for i in {1..20..1}
do
  echo "Randomly extracting 1% of SNPs from "${Contigs[$i]}": "`date`
  gatk SelectVariants \
    -R $REFERENCE \
    -V $DATA_DIR/All_${Contigs[$i]}_${Genome,,}_SNPs_Filtered_Selected.vcf.gz \
    -O $OUT_DIR/Random_100k_${Contigs[$i]}_${Genome,,}_SNPs_Filtered_Selected.vcf \
    --select-random-fraction 0.01
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

## Merging all the output into a single vcf to be converted
gatk MergeVcfs \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrI_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrIII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrIV_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrV_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrVI_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrVII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrVIII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrIX_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrX_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXI_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXIII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXIV_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXV_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXVI_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXVII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXVIII_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXX_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -I $OUT_DIR/Random_100k_"$Chr_prefix"chrXXI_"${Genome,,}"_SNPs_Filtered_Selected.vcf \
  -O /data/scratch/btx316/Comp_Genomics/20_Phylogeny/01_RandomSNPs/All_Autosome_Random_100k_"$Genome"_SNPs_Filtered_Selected.vcf
  
echo "All Done"