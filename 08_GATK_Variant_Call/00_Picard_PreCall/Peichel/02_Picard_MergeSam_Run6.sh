#!/bin/bash
#$ -N Merging_Peichel_6
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/03_Merged

newname="BS56.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS56.HWI-ST143_0336_3.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS56.HWI-ST225_0160_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS56.HWI-ST225_0160_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS56.UnknownInstrumentName_11.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS56.UnknownInstrumentName_11.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS56.UnknownInstrumentName_11.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS56.HWI-ST225_354_C07C7ACXX_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS57.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS57.HWI-ST225_0237_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS57.HWI-ST225_0237_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS57.HWI-ST486_0061_3.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS57.HWI-ST486_0061_3.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS57.UnknownInstrumentName_11.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS57.UnknownInstrumentName_11.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS57.UnknownInstrumentName_11.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS57.HWI-ST225_354_C07C7ACXX_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS58.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS58b.HWI-ST225_0237_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS58b.HWI-ST225_0237_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS58b.HWI-ST143_0369_16.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS58b.HWI-ST143_472_D0JDUACXX_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS59.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS59.HWI-ST225_0160_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS59.HWI-ST225_0160_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS59.UnknownInstrumentName_5.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS59.HWI-ST225_0192_8.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS59.HWI-ST486_0066_6.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS59.UnknownInstrumentName_11.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS59.HWI-ST143_472_D0JDUACXX_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS59.HWI-ST225_369_D0JEPACXX_2.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS60.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS60.HWI-ST486_0065_2.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS60.HWI-ST486_0065_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS60.HWI-ST225_0192_8.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS60.HWI-ST225_354_C07C7ACXX_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS60.HWI-ST225_369_D0JEPACXX_2.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS61.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS61.HWI-ST225_0237_15.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS61.HWI-ST225_0237_15.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS61.HWI-ST486_0065_2.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS61.HWI-ST486_0065_2.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS61.HWI-ST486_0121_7.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS61.UnknownInstrumentName_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS61.HWI-ST225_0231_12.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS61.HWI-ST486_0059_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS61.HWI-ST225_369_D0JEPACXX_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS61.HWI-ST486_212_D0C8BACXX_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS62.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS62.HWI-ST143_0336_3.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS62.HWI-ST225_0160_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS62.HWI-ST225_0160_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS62.HWI-ST225_0237_15.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS62.HWI-ST225_0237_15.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS62.UnknownInstrumentName_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS62.HWI-ST486_0066_6.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS62.HWI-ST486_0066_6.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS62.HWI-ST486_0066_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS62.HWI-ST486_0066_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS62.HWI-ST143_472_D0JDUACXX_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS62.HWI-ST225_369_D0JEPACXX_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS63.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS63b.HWI-ST225_0237_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS63b.HWI-ST225_0237_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS63b.HWI-ST486_0090_14.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS63b.HWI-ST143_472_D0JDUACXX_2.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS63b.HWI-ST225_354_C07C7ACXX_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS64.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS64b.HWI-ST225_0160_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS64b.HWI-ST225_0160_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS64b.HWI-ST486_0066_6.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS64b.HWI-ST486_0066_6.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS64b.HWI-ST486_0066_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS64b.HWI-ST486_0066_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS64b.HWI-ST225_369_D0JEPACXX_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS65.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS65.HWI-ST486_0062_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS65.HWI-ST486_0065_2.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS65.HWI-ST486_0065_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS65.HWI-ST225_0231_12.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS65.HWI-ST486_0059_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS65.HWI-ST225_354_C07C7ACXX_1.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS66.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS66.HWI-ST486_0065_2.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS66.HWI-ST486_0066_6.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS66.HWI-ST486_0066_6.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS66.HWI-ST486_0066_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS66.HWI-ST486_0066_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS66.HWI-ST143_472_D0JDUACXX_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"