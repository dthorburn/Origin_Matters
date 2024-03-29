#!/bin/bash
#$ -N X06_Merging_5
#$ -j y
#$ -cwd
#$ -t 2
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gatk/4.1.6.0

## Ensuring all the genomes and chroms can fit within 1 script. 
if [ ${SGE_TASK_ID} == 1 ]
then 
  Genome="Peichel"
elif [ ${SGE_TASK_ID} == 2 ]
then
  Genome="Gynogene"
fi

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/"$Genome"/03_Merged

newname="BS45.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST143_0336_3.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST225_0160_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST225_0160_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS45.HWI-ST486_212_D0C8BACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS46.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS46.HWI-ST225_0160_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS46.HWI-ST225_0160_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.HWI-ST225_0194_9.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.HWI-ST225_0231_12.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.UnknownInstrumentName_11.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS46.HWI-ST486_212_D0C8BACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS47.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS47.HWI-ST225_0160_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS47.HWI-ST225_0160_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS47.HWI-ST486_212_D0C8BACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS48.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS48.HWI-ST225_0160_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS48.HWI-ST225_0160_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST225_0231_12.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST486_0061_3.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST486_0061_3.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.UnknownInstrumentName_11.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS48.HWI-ST486_212_D0C8BACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS49.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS49.HWI-ST225_0237_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS49.HWI-ST225_0237_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST486_0061_3.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST486_0061_3.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS49.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS50.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS50b.HWI-ST225_0160_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS50b.HWI-ST225_0160_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS50b.UnknownInstrumentName_5.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST143_0369_17.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST225_0192_8.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST225_0192_8.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.UnknownInstrumentName_11.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS50b.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS51.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS51.HWI-ST225_0237_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS51.HWI-ST225_0237_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS51.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS51.HWI-ST225_369_D0JEPACXX_2.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS52.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS52b.HWI-ST225_0237_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS52b.HWI-ST225_0237_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS52b.HWI-ST143_0369_16.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS52b.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS53.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS53.HWI-ST225_0237_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS53.HWI-ST225_0237_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS53.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS53.HWI-ST225_369_D0JEPACXX_2.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS54.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS54.HWI-ST225_0160_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS54.HWI-ST225_0160_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS54.HWI-ST225_354_C07C7ACXX_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS55.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS55.HWI-ST143_0336_3.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS55.UnknownInstrumentName_5.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.HWI-ST225_0231_12.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS55.HWI-ST225_354_C07C7ACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"