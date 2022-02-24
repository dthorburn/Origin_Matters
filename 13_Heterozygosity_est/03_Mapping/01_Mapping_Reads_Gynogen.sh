#!/bin/bash
#$ -N Mapping_Peichel
#$ -j Y
#$ -cwd
#$ -t 1
#$ -pe smp 2 ## requesting 2 nodes
#$ -l h_rt=18:00:00
#$ -l h_vmem=12G

module load samtools/1.4.1
module load bwa/0.7.15

DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/01_Trimmed_Reads/QC
OUTDIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/02_Mapped_Reads
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/15_Heterozygosity_est/03_Mapping

## Getting the file names and defining the RGs
if [ ${SGE_TASK_ID} = 1 ]
then 
  R1_file="121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_1.fq.gz.clean.dup.clean_trimmed.fastq.gz" 
  RG_ID="SZABPI017450-17"
  RG_PU="IlluminaPE.L4.I235"
  RG_SM="Gynogen1"
  RG_LB="LIB170BP"
fi
if [ ${SGE_TASK_ID} = 2 ]
then 
  R1_file="121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_1.fq.gz.clean.dup.clean_trimmed.fastq.gz"
  RG_ID="SZAIPI017449-21"
  RG_PU="IlluminaPE.L4.I235"
  RG_SM="Gynogen1"
  RG_LB="LIB500BP"
fi
if [ ${SGE_TASK_ID} = 3 ]
then
  R1_file="121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_1.fq.gz.clean.dup.clean_trimmed.fastq.gz"
  RG_ID="SZAMPI017448-23"
  RG_PU="IlluminaPE.L8.I235"
  RG_SM="Gynogen1"
  RG_LB="LIB800BP"
fi

R2_file=`basename $R1_file | sed -e "s/_1.fq.gz.clean.dup.clean_trimmed.fastq.gz/_2.fq.gz.clean.dup.clean_trimmed.fastq.gz/"`
echo $R1_file $R2_file

## Creating the output name
newname=`basename $R1_file | sed -e "s/_1.fq.gz.clean.dup.clean_trimmed.fastq.gz/_gynogen_aligned.sam/"`
#newname=`basename $R1_file | sed -e "s/.read_1.clean_trimmed.fastq.gz/_gynogene_aligned.sam/"`
echo $newname

echo $RG_ID $RG_PU $RG_SM $RG_LB 

bwa mem -M -t 2 -R $(echo "@RG\tID:EU_Gynogen_$RG_ID\tPU:$RG_PU\tSM:$RG_SM\tLB:$RG_LB\tPL:Illumina") $REFERENCE/Gynogen_pchrom_assembly_all.fasta $DATA_DIR/"$R1_file" $DATA_DIR/"$R2_file" > $OUTDIR/sam_files/"$newname"
#bwa mem -M -t 2 -R "@RG\tID:$Population$RG_ID\tPU:$RG_PU\tSM:$RG_SM\tLB:$RG_LB\tPL:Illumina" $REFERENCE/Gynogen_PacBio_reference.fasta $DATA_DIR/"$R1_file" $DATA_DIR/"$R2_file" > $OUTDIR/sam_files/"$newname"

#Convert Sam format to BAM format
newname2=`basename $OUTDIR/sam_files/"$newname" | sed -e "s/.sam/.bam/"`
samtools sort -o $OUTDIR/bam_files/"$newname2" $OUTDIR/sam_files/"$newname"
samtools index $OUTDIR/bam_files/"$newname2"

## Generating the flagstat output too
stats_name=`basename $OUTDIR/sam_files/"$newname" | sed -e "s/_aligned.sam/.txt/"`
samtools flagstat $OUTDIR/sam_files/"$newname" > $SCRIPTS/"$stats_name"

## Removing the sam file for the sake of space.
rm $OUTDIR/sam_files/"$newname"
