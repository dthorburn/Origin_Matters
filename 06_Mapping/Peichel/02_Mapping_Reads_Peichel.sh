#!/bin/bash
#$ -N Mapping_Peichel
#$ -j Y
#$ -cwd
#$ -t 23-24
#$ -pe smp 2 ## requesting 2 nodes
#$ -l h_rt=18:00:00
#$ -l h_vmem=12G

module load samtools/1.4.1
module load bwa/0.7.15

DATA_DIR=/data/scratch/btx316/Comp_Genomics/01_Trimmed_Reads/QC
OUTDIR=/data/scratch/btx316/Comp_Genomics/02_Mapped/Peichel
#OUTDIR=/data/scratch/btx316/Comp_Genomics/02_Mapped/Gynogene
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/05_Mapping
STATS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/05_Mapping/Flagstats/Peichel
#STATS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/05_Mapping/Flagstats/Gynogene

## Getting the R1 read
R1_file=`sed ${SGE_TASK_ID}"q;d" $DATA_DIR/01_Filtered_R1_File_List.txt`
echo $R1_file
## Converting the R1 name to the R2 name
R2_file=`basename $R1_file | sed -e "s/.read_1.clean_trimmed.fastq.gz/.read_2.clean_trimmed.fastq.gz/"`
echo $DATA_DIR/"$R2_file"
## Creating the output name
newname=`basename $R1_file | sed -e "s/.read_1.clean_trimmed.fastq.gz/_peichel_aligned.sam/"`
#newname=`basename $R1_file | sed -e "s/.read_1.clean_trimmed.fastq.gz/_gynogene_aligned.sam/"`
echo $newname

## Creating RG names       
RG_PU=`echo $R1_file | sed -r 's/.{25}$/5/'`
## creates object RG_PU from the name of the file - from BS[x]... until just before .clean.fastq.gz
RG_ID=`echo $R1_file | sed -r 's/.{30}$//'`
## much the same as above, but shortens it even more - the PU is meant to be the most informative - shortening to avoid collisions
RG_SM=`echo $R1_file |  sed "s/.*\(BS[0-9][0-9]\).*/\1/"`
##qsub  creates object RG_SM from the name of the file - from BS[x]
RG_LB=`echo $RG_PU | sed -e 's/.read_1/peichel.lib/'`
#RG_LB=`echo $RG_PU | sed -e 's/.read_1/gynogene.lib/'`
echo $RG_ID 
echo $RG_PU
echo $RG_SM 
echo $RG_LB 

bwa mem -M -t 2 -R "@RG\tID:$Population$RG_ID\tPU:$RG_PU\tSM:$RG_SM\tLB:$RG_LB\tPL:Illumina" $REFERENCE/Gac-HiC_revised_genome_assembly.fasta $DATA_DIR/"$R1_file" $DATA_DIR/"$R2_file" > $OUTDIR/sam_files/"$newname"
#bwa mem -M -t 2 -R "@RG\tID:$Population$RG_ID\tPU:$RG_PU\tSM:$RG_SM\tLB:$RG_LB\tPL:Illumina" $REFERENCE/Gynogen_PacBio_reference.fasta $DATA_DIR/"$R1_file" $DATA_DIR/"$R2_file" > $OUTDIR/sam_files/"$newname"

#Convert Sam format to BAM format
newname2=`basename $OUTDIR/sam_files/"$newname" | sed -e "s/.sam/.bam/"`
samtools sort -o $OUTDIR/bam_files/"$newname2" $OUTDIR/sam_files/"$newname"
samtools index $OUTDIR/bam_files/"$newname2"

## Generating the flagstat output too
stats_name=`basename $OUTDIR/sam_files/"$newname" | sed -e "s/_aligned.sam/.txt/"`
samtools flagstat $OUTDIR/sam_files/"$newname" > $STATS/"$stats_name"

## Removing the sam file for the sake of space.
rm $OUTDIR/sam_files/"$newname"
