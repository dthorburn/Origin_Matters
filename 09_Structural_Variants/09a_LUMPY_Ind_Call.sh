#!/bin/bash
#$ -N X09a_LUMPY_Individual_Calls
#$ -cwd
#$ -j y
#$ -pe smp 2
#$ -l h_rt=24:00:00
#$ -l highmem
#$ -l h_vmem=24G
#$ -t 108

## Failed Task IDs I need to update. 
## 106: chrVII chrXIV
## 108: chrXIV
## 119: chrVII chrXIV

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
chroms="chrXIV"

#module load samtools/1.8
#module load python/3.6.3
module load singularity

BAM_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
SPLIT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/01_Splitting_bams/"$Genome"
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/01_Prepare_Bams/Peichel
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/02_LumpyExpress_Output/"$Genome"
if [ $Genome == "Peichel" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome/Ind_Chroms/Peichel_Reference_Masked.fasta
elif [ $Genome == "Gynogene" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/Ind_Chroms/Gynogene_Reference_Masked.fasta
fi

for chrom in ${chroms}
do
  echo "Starting "$Genome" "$chr_prefix"$chrom"": "`date`
  ## Running LumpyExpress
  singularity exec /data/containers/lumpy/0.3.0/centos7-lumpy-0.3.0.img \
    lumpyexpress -k -P \
      -R $REFERENCE \
      -B $BAM_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.bam \
      -S $SPLIT_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.splitters."$chr_prefix""$chrom".bam \
      -D $SPLIT_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.discordant."$chr_prefix""$chrom".bam \
      -o $OUT_DIR/BS"$ID"_Lumpy_CNV_"$Genome"."$chr_prefix""$chrom".bam.vcf
  echo "Finished running LumpyExpress on "$Genome" "$chrom": "`date`
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done