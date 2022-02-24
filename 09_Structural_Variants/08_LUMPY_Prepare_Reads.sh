#!/bin/bash
#$ -N X08_Lumpy_Process_Bams
#$ -j y
#$ -cwd
#$ -t 67-132
#$ -l h_rt=2:00:00
#$ -l h_vmem=6G

#module load use.dev lumpy
module load samtools
module load python/3.6.3

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

chroms="chrI chrII chrIII chrIV chrV chrVI chrVII chrVIII chrIX chrX chrXI chrXII chrXIII chrXIV chrXV chrXVI chrXVII chrXVIII chrXX chrXXI"

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/04_MarkDups
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/01_Splitting_bams/"$Genome"
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/06_New_Pipeline_Whole

## This pipeline is taken from: https://github.com/arq5x/lumpy-sv#lumpy-traditional-usage
for chrom in ${chroms}
do
  echo "Starting with "$chrom": "`date`
  ## Getting the discordant reads first
  samtools view -b -F 1294 $DATA_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.bam "$chr_prefix"$chrom | samtools sort > $OUT_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.discordant."$chr_prefix""$chrom".bam

  echo "Discordant alignment extracted"

  ## Getting the split-read alignments
  samtools view -h $DATA_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.bam "$chr_prefix"$chrom \
      | python $SCRIPTS/08_extractSplitReads_BwaMem -i stdin \
      | samtools view -Sb - \
      | samtools sort > $OUT_DIR/BS"$ID".cleaned.sorted.merged."${Genome,,}".markdup.splitters."$chr_prefix"$chrom.bam

  echo "Done with "$chrom": "`date`
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done