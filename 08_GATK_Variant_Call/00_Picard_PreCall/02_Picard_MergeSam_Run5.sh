#!/bin/bash
#$ -N Merging_Gynogene_5
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/03_Merged

newname="BS45.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST143_0336_3.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST225_0160_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS45.HWI-ST225_0160_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS45.HWI-ST486_0066_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS45.HWI-ST486_212_D0C8BACXX_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS46.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS46.HWI-ST225_0160_1.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS46.HWI-ST225_0160_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.HWI-ST225_0194_9.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.HWI-ST225_0231_12.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS46.UnknownInstrumentName_11.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS46.HWI-ST486_212_D0C8BACXX_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS47.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS47.HWI-ST225_0160_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS47.HWI-ST225_0160_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS47.HWI-ST486_212_D0C8BACXX_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS48.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS48.HWI-ST225_0160_1.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS48.HWI-ST225_0160_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST225_0231_12.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST486_0061_3.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.HWI-ST486_0061_3.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS48.UnknownInstrumentName_11.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS48.HWI-ST486_212_D0C8BACXX_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS49.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS49.HWI-ST225_0237_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS49.HWI-ST225_0237_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST225_0194_9.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST486_0061_3.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS49.HWI-ST486_0061_3.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS49.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS50.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS50b.HWI-ST225_0160_1.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS50b.HWI-ST225_0160_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS50b.UnknownInstrumentName_5.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST143_0369_17.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST225_0192_8.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.HWI-ST225_0192_8.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS50b.UnknownInstrumentName_11.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS50b.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS51.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS51.HWI-ST225_0237_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS51.HWI-ST225_0237_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS51.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS51.HWI-ST225_369_D0JEPACXX_2.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS52.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS52b.HWI-ST225_0237_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS52b.HWI-ST225_0237_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS52b.HWI-ST143_0369_16.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS52b.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS53.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS53.HWI-ST225_0237_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS53.HWI-ST225_0237_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS53.HWI-ST486_0066_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS53.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS53.HWI-ST225_369_D0JEPACXX_2.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS54.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS54.HWI-ST225_0160_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS54.HWI-ST225_0160_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS54.HWI-ST486_0066_6.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS54.HWI-ST225_354_C07C7ACXX_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS55.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS55.HWI-ST143_0336_3.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS55.UnknownInstrumentName_5.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.HWI-ST225_0231_12.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS55.UnknownInstrumentName_11.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS55.HWI-ST225_354_C07C7ACXX_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"