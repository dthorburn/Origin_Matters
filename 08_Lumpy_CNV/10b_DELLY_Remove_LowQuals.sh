#!/bin/bash
#$ -N X10_DELLY_Filtering
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=6G
#$ -t 1-132

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

## Setting the appropriate directories
BAM_DIR=/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/00_BAMS/"$Genome"
OUT_DIR=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/09_Merge_SURVIVOR/01_Filtered_Dellys/"$Genome"

if [ $Genome == "Peichel" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome/Gac-HiC_revised_genome_assembly.fasta
elif [ $Genome == "Gynogene" ]
then
  REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/Gynogen_pchrom_assembly_all.fasta
fi

module load gatk/4.1.6.0

for chrom in ${chroms}
do
  echo "Starting "$Genome" "$chr_prefix"$chrom"": "`date`
  SVCF=/data/scratch/btx316/Comp_Genomics/05_Lumpy_CNV/02_Delly_Output/"$Genome"/BS"$ID"_Delly_CNV_"$Genome"."$chr_prefix""$chrom".bam.vcf
  Newname=`basename $SVCF | sed -e "s/bam.vcf/Filtered.GT.vcf/"`
  
  gatk SelectVariants \
    -R $REFERENCE \
    -V $SVCF \
    -O $OUT_DIR/"$Newname" \
    -select 'vc.isNotFiltered()'

  echo "Finished filtering LowQuals calls in "$Genome" $chr_prefix"$chrom": "`date`
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

