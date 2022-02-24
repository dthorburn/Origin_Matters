#!/bin/bash
#$ -N Merging_Peichel_4
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G

module load gatk

DATA_DIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/02_CleanSam
OUTDIR=/data/scratch/btx316/Comp_Genomics/03_Picard_Cleaning/Peichel/03_Merged

newname="BS34.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS34b.HWI-ST143_0336_3.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS34b.HWI-ST225_0160_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS34b.UnknownInstrumentName_5.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS34b.UnknownInstrumentName_5.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.HWI-ST225_0167_5.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.HWI-ST225_0167_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.HWI-ST225_0167_5.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.HWI-ST225_0192_8.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.HWI-ST486_0064_4.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS34b.UnknownInstrumentName_11.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS34b.HWI-ST486_212_D0C8BACXX_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS35.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS35.HWI-ST225_0237_15.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS35.UnknownInstrumentName_5.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS35.HWI-ST486_0102_15.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS35.HWI-ST486_0102_15.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS35.HWI-ST486_0102_15.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS35.HWI-ST486_212_D0C8BACXX_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS36.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS36b.HWI-ST143_0336_3.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS36b.HWI-ST225_0160_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS36b.HWI-ST225_0160_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST143_0320_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST225_0167_5.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST225_0167_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST225_0167_5.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST225_0231_12.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS36b.HWI-ST486_0064_4.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS36b.HWI-ST225_369_D0JEPACXX_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS36b.HWI-ST486_212_D0C8BACXX_1.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS37.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS37.HWI-ST225_0160_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS37.HWI-ST486_0102_15.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS37.HWI-ST486_0102_15.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS37.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS38.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS38b.HWI-ST143_0338_4.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS38b.HWI-ST225_0160_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS38b.HWI-ST225_0160_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS38b.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS39.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS39.HWI-ST143_0338_4.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS39.UnknownInstrumentName_5.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS39.HWI-ST143_0347_10.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS39.HWI-ST143_0347_10.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS39.HWI-ST143_0347_10.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS39.HWI-ST143_0347_10.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS39.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS40.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS40b.HWI-ST225_0237_6.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS40b.HWI-ST225_0237_6.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0337_7.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0337_7.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0337_7.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0337_7.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0347_10.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0347_10.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0347_10.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS40b.HWI-ST143_0347_10.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS40b.HWI-ST225_369_D0JEPACXX_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS40b.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS41.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS41.HWI-ST225_0160_1.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS41.HWI-ST225_0160_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0337_7.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0337_7.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0337_7.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0347_10.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0347_10.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0347_10.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST143_0347_10.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST486_0102_15.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST486_0102_15.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS41.HWI-ST486_0102_15.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS41.HWI-ST225_369_D0JEPACXX_2.Lane_5_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS41.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS42.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS42b.HWI-ST225_0160_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS42b.HWI-ST225_0160_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS42b.UnknownInstrumentName_5.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS42b.UnknownInstrumentName_5.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS42b.HWI-ST225_0167_5.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS42b.HWI-ST225_0167_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS42b.HWI-ST225_0167_5.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS42b.HWI-ST486_0064_4.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS42b.HWI-ST486_212_D0C8BACXX_1.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS43.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS43.HWI-ST225_0160_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS43.HWI-ST225_0160_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS43.UnknownInstrumentName_5.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST143_0320_2.Lane_1_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST225_0167_5.Lane_6_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST225_0167_5.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST225_0167_5.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST225_0231_12.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_STD.BS43.HWI-ST486_0064_4.Lane_8_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS43.HWI-ST486_212_D0C8BACXX_1.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS44.cleaned.sorted.merged.peichel.bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5353_4kb.BS44.HWI-ST143_0336_3.Lane_2_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS44.HWI-ST225_0160_1.Lane_3_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5353_4kb.BS44.HWI-ST225_0160_1.Lane_4_peichel_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS44.HWI-ST486_212_D0C8BACXX_1.Lane_7_peichel_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"