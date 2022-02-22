#!/bin/bash
#$ -N Ref_Genome_Prep
#$ -j y
#$ -cwd
#$ -t 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=16G

module load bwa
module load gatk

DATA_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes

for genome in Gynogene_Genome #Peichel_Genome
do
  echo $genome
  ref=`ls $DATA_DIR/"$genome"/*.fasta`
  dict_name=`basename $ref | sed -e "s/.fasta/.dict/"`
  cd $DATA_DIR/"$genome"
  bwa index $ref
  samtools faidx $ref
  gatk CreateSequenceDictionary \
    -R $ref #\
    #-O $DATA_DIR/"$genome"/"$dict_name"
done
