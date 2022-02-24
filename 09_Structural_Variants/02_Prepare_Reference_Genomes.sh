#!/bin/bash
#$ -N X02_Ref_Genome_Prep
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=6:00:00
#$ -l h_vmem=12G

module load bwa
module load gatk

for Genome in Gynogene #Peichel #Gynogene
do
  echo $genome
  Reference=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/"$Genome"_Genome/Ind_Chroms/"$Genome"_Reference_Masked.fasta
  dict_name=`basename $Reference | sed -e "s/.fasta/.dict/"`
  cd /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/"$Genome"_Genome/Ind_Chroms
  bwa index $Reference
  samtools faidx $Reference
  gatk CreateSequenceDictionary \
    -R $Reference
     #\
    #-O $DATA_DIR/"$genome"/"$dict_name"
done
