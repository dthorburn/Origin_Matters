#!/bin/bash
#$ -N Trimming_reads
#$ -j Y
#$ -cwd
#$ -t 1-3
#$ -pe smp 1
#$ -l h_rt=6:00:00
#$ -l h_vmem=6G

#module load trimmomatic
DATA_DIR=/data/archive/archive-SBCS-EizaguirreLab/Gynogen_assembly/02_Filtered_Data/Illumina_Q33
OUT_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/01_Trimmed_Reads
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/15_Heterozygosity_est/02_Trimming
TOOL=/data/home/btx316/privatemodules/trimmomatic/Trimmomatic-0.36

## Getting the file names
if [ ${SGE_TASK_ID} = 1 ]; then R1_query_file="121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_1.fq.gz.clean.dup.clean.fastq.gz"; fi
if [ ${SGE_TASK_ID} = 2 ]; then R1_query_file="121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_1.fq.gz.clean.dup.clean.fastq.gz"; fi
if [ ${SGE_TASK_ID} = 3 ]; then R1_query_file="121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_1.fq.gz.clean.dup.clean.fastq.gz"; fi
#121117_I235_FCD0WEEACXX_L4_SZABPI017450-17_2.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L4_SZAIPI017449-21_2.fq.gz.clean.dup.clean.fastq.gz 121117_I235_FCD0WEEACXX_L8_SZAMPI017448-23_2.fq.gz.clean.dup.clean.fastq.gz
R2_query_file=`basename $R1_query_file | sed -e "s/_1.fq.gz.clean.dup.clean.fastq.gz/_2.fq.gz.clean.dup.clean.fastq.gz/"`
echo $R1_query_file $R2_query_file

## Making a new output names
R1_Paired=`basename $R1_query_file | sed -e "s/.fastq.gz/_trimmed.fastq.gz/"`
R1_Orphan=`basename $R1_query_file | sed -e "s/.fastq.gz/_trimmed_FAILED.fastq.gz/"`
R1_Length=`basename $R1_query_file | sed -e "s/.fastq.gz/_Lengths.txt/"`
R2_Paired=`basename $R2_query_file | sed -e "s/.fastq.gz/_trimmed.fastq.gz/"`
R2_Orphan=`basename $R2_query_file | sed -e "s/.fastq.gz/_trimmed_FAILED.fastq.gz/"`
R2_Length=`basename $R1_query_file | sed -e "s/.fastq.gz/_Lengths.txt/"`

## Trimming the sequence, so that the trailing end is cut if sequences are below 20. 
java -jar $TOOL/trimmomatic-0.36.jar PE -phred33 $DATA_DIR/"$R1_query_file" $DATA_DIR/"$R2_query_file" $OUT_DIR/QC/"$R1_Paired" $OUT_DIR/QC/Orphaned/"$R1_Orphan" $OUT_DIR/QC/"$R2_Paired" $OUT_DIR/QC/Orphaned/"$R2_Orphan" TRAILING:20 MINLEN:49

## Generating a distribution of lengths
zcat $OUT_DIR/QC/"$R1_Paired" | awk '{if(NR%4==2) print length($1)}' | sort -n | uniq -c > $OUT_DIR/Length/"$R1_Length"
zcat $OUT_DIR/QC/"$R2_Paired" | awk '{if(NR%4==2) print length($1)}' | sort -n | uniq -c > $OUT_DIR/Length/"$R2_Length"

echo "Done for "$R1_query_file

## Testing that the numbers of reads matched in the two files 
#module load bwa
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#bwa mem -M -t 1 $REFERENCE/Gac-HiC_revised_genome_assembly.fasta $OUT_DIR/QC/NG-5241_4kb.BS10.UnknownInstrumentName_1.Lane_4.read_1.clean_trimmed.fastq.gz $OUT_DIR/QC/NG-5241_4kb.BS10.UnknownInstrumentName_1.Lane_4.read_2.clean_trimmed.fastq.gz > $OUT_DIR/QC/testing.sam