#!/bin/bash
#$ -N Merging_Gynogene_3
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Gynogene/03_Merged

newname="BS23.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS23.UnknownInstrumentName_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.HWI-ST225_0192_8.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.HWI-ST225_0192_8.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS23.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS23.HWI-ST486_212_D0C8BACXX_1.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS24.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS24.UnknownInstrumentName_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST225_0194_9.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST225_0231_14.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST225_0231_14.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS24.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS24.HWI-ST486_212_D0C8BACXX_1.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS25.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS25.UnknownInstrumentName_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.HWI-ST225_0194_9.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS25.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS25.HWI-ST225_369_D0JEPACXX_2.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS25.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS26.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS26.UnknownInstrumentName_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.HWI-ST225_0194_9.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS26.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS26.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS27.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS27.UnknownInstrumentName_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.UnknownInstrumentName_12.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.UnknownInstrumentName_13.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS27.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS27.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS28.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS28.UnknownInstrumentName_1.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST225_0192_8.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST225_0192_8.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST225_0231_14.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS28.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS28.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS29.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS29.UnknownInstrumentName_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.HWI-ST225_0194_9.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.HWI-ST225_0231_14.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS29.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS29.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS30.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS30.HWI-ST143_0336_1.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.HWI-ST225_0141_2.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.HWI-ST225_0194_9.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.HWI-ST225_0231_14.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.HWI-ST486_0064_7.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.HWI-ST486_0064_7.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.UnknownInstrumentName_4.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS30.UnknownInstrumentName_4.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS30.HWI-ST486_212_D0C8BACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS31.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS31b.HWI-ST143_0336_3.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS31b.HWI-ST225_0160_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS31b.HWI-ST225_0160_1.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS31b.HWI-ST225_0167_5.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS31b.HWI-ST225_0167_5.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS31b.HWI-ST225_0167_5.Lane_8_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS31b.HWI-ST486_0064_4.Lane_8_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS31b.UnknownInstrumentName_11.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS31b.HWI-ST486_212_D0C8BACXX_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS32.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS32b.UnknownInstrumentName_5.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0167_5.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0167_5.Lane_7_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0167_5.Lane_8_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0192_8.Lane_8_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0194_9.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST225_0194_9.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS32b.HWI-ST486_0064_4.Lane_8_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS32b.HWI-ST143_472_D0JDUACXX_1.Lane_4_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS33.cleaned.sorted.merged.gynogene.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS33.HWI-ST143_0336_3.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS33.HWI-ST225_0160_1.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS33.HWI-ST225_0160_1.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS33.HWI-ST225_0237_15.Lane_6_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS33.HWI-ST143_0369_17.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS33.HWI-ST225_0194_9.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS33.HWI-ST486_0105_15.Lane_1_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS33.HWI-ST486_0105_15.Lane_2_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS33.HWI-ST486_0105_15.Lane_3_gynogene_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS33.HWI-ST486_212_D0C8BACXX_1.Lane_5_gynogene_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"