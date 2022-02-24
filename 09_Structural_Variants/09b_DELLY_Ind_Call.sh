#!/bin/bash
#$ -N X09b_Delly_Individual_Call
#$ -cwd
#$ -j y
#$ -l h_rt=14:00:00
#$ -l h_vmem=6G
#$ -t 41

module load bcftools

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} -le 66 ]
then 
  Genome="Peichel"
  chr_prefix=""
  ID=${SGE_TASK_ID}
elif [ ${SGE_TASK_ID} -ge 67 ]
then
  Genome="Gynogene"
  chr_prefix="Gy_"
  ID=`expr ${SGE_TASK_ID} - 66`
fi

#chroms="chrI chrII chrIII chrIV chrV chrVI chrVII chrVIII chrIX chrX chrXI chrXII chrXIII chrXIV chrXV chrXVI chrXVII chrXVIII chrXX chrXXI"
chroms="chrXXI"

## Defining the databases
TOOL=/data/home/btx316/privatemodules/Delly
BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/02_Delly_Output/"$Genome"
if [ $Genome == "Peichel" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome/Ind_Chroms/Peichel_Reference_Masked.fasta
elif [ $Genome == "Gynogene" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/Ind_Chroms/Gynogene_Reference_Masked.fasta
fi

cd $OUT_DIR

for chrom in ${chroms}
do
  echo "Starting "$Genome" "$chr_prefix"$chrom"": "`date`
  ## Step 1 - Delly call
  $TOOL/delly_v0.8.3_linux_x86_64bit call -o $OUT_DIR/BS"$ID"_Delly_CNV_"$Genome"."$chr_prefix""$chrom".bam.bcf -g $REFERENCE $BAM_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.bam
  bcftools view $OUT_DIR/BS"$ID"_Delly_CNV_"$Genome"."$chr_prefix""$chrom".bam.bcf > $OUT_DIR/BS"$ID"_Delly_CNV_"$Genome"."$chr_prefix""$chrom".bam.vcf
  rm $OUT_DIR/BS"$ID"_Delly_CNV_"$Genome"."$chr_prefix""$chrom".bam.bcf
  echo "Finished running Delly on "$Genome" "$chr_prefix"$chrom"": "`date`
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done