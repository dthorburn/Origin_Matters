#!/bin/bash
#$ -N Trimming_reads
#$ -j Y
#$ -cwd
#$ -t 1-560
#$ -pe smp 1
#$ -l h_rt=6:00:00
#$ -l h_vmem=6G

#module load trimmomatic

DATA_DIR=/data/scratch/btx316/Comp_Genomics/00_Raw_Data
OUT_DIR=/data/scratch/btx316/Comp_Genomics/01_Trimmed_Reads
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/04_Trimming
TOOL=/data/home/btx316/privatemodules/trimmomatic/Trimmomatic-0.36

## Getting the file name from the list
R1_query_file=`sed ${SGE_TASK_ID}"q;d" $SCRIPTS/01_R1_File_List.txt`
#R1_query_file=`sed ${SGE_TASK_ID}"q;d" $SCRIPTS/02_Redo_File_List.txt`
R2_query_file=`basename $R1_query_file | sed -e "s/.read_1.clean.fastq.gz/.read_2.clean.fastq.gz/"`
echo $R1_query_file $R2_query_file

## Additing the length filter. 
LN_Filter=51
if [[ $R1_query_file == *"4kb"* ]]; then
  LN_Filter=26
fi
## Some of the 4kb libraries are not labelled as mate-pair. 
if [[ $R1_query_file == "NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_1.read_"* ]]; then LN_Filter=26; echo "Changed length filter for "$R1_query_file; fi
if [[ $R1_query_file == "NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_3.read_"* ]]; then LN_Filter=26; echo "Changed length filter for "$R1_query_file; fi
if [[ $R1_query_file == "NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_5.read_"* ]]; then LN_Filter=26; echo "Changed length filter for "$R1_query_file; fi
if [[ $R1_query_file == "NG-5353_STD.BS43.HWI-ST143_0320_2.Lane_1.read_"* ]]; then LN_Filter=26; echo "Changed length filter for "$R1_query_file; fi

## Making a new output names
R1_Paired=`basename $R1_query_file | sed -e "s/.fastq.gz/_trimmed.fastq.gz/"`
R1_Orphan=`basename $R1_query_file | sed -e "s/.fastq.gz/_trimmed_FAILED.fastq.gz/"`
R1_Length=`basename $R1_query_file | sed -e "s/.fastq.gz/_Lengths.txt/"`

R2_Paired=`basename $R2_query_file | sed -e "s/.fastq.gz/_trimmed.fastq.gz/"`
R2_Orphan=`basename $R2_query_file | sed -e "s/.fastq.gz/_trimmed_FAILED.fastq.gz/"`
R2_Length=`basename $R1_query_file | sed -e "s/.fastq.gz/_Lengths.txt/"`

#BaseName1=`basename $R1_query_file | sed -e "s/.Lane_..read_..clean.fastq.gz//"`
#echo $BaseName1

## Trimming the sequence, so that the trailing end is cut if sequences are below 20. 
java -jar $TOOL/trimmomatic-0.36.jar PE -phred33 $DATA_DIR/"$R1_query_file" $DATA_DIR/"$R2_query_file" $OUT_DIR/QC2/"$R1_Paired" $OUT_DIR/QC2/Orphaned/"$R1_Orphan" $OUT_DIR/QC2/"$R2_Paired" $OUT_DIR/QC2/Orphaned/"$R2_Orphan" TRAILING:20 MINLEN:$LN_Filter
#SLIDINGWINDOW:10:20
## Generating a distribution of lengths
#zcat $OUT_DIR/QC/"$R1_Paired" | awk '{if(NR%4==2) print length($1)}' | sort -n | uniq -c > $OUT_DIR/Length/"$R1_Length"
#zcat $OUT_DIR/QC/"$R2_Paired" | awk '{if(NR%4==2) print length($1)}' | sort -n | uniq -c > $OUT_DIR/Length/"$R2_Length"

echo "Done for "$query_file

## Testing that the numbers of reads matched in the two files 
#module load bwa
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
#bwa mem -M -t 1 $REFERENCE/Gac-HiC_revised_genome_assembly.fasta $OUT_DIR/QC/NG-5241_4kb.BS10.UnknownInstrumentName_1.Lane_4.read_1.clean_trimmed.fastq.gz $OUT_DIR/QC/NG-5241_4kb.BS10.UnknownInstrumentName_1.Lane_4.read_2.clean_trimmed.fastq.gz > $OUT_DIR/QC/testing.sam