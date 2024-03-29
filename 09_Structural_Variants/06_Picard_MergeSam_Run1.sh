#!/bin/bash
#$ -N X06_Merging_1
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

newname="BS1.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS1.UnknownInstrumentName_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0192_8.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST225_0192_8.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS1.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS1.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS2.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS2.HWI-ST143_0336_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS2.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS2.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS3.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS3.HWI-ST143_0336_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS3.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS3.HWI-ST225_369_D0JEPACXX_2.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS3.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS4.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS4.HWI-ST143_0336_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST143_0347_10.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST143_0347_10.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST143_0347_10.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST143_0347_10.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST143_0369_16.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST486_0105_15.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST486_0105_15.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS4.HWI-ST486_0105_15.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS4.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS5.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS5.UnknownInstrumentName_1.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0192_8.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST225_0192_8.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS5.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS5.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS5.HWI-ST225_369_D0JEPACXX_2.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS6.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS6.UnknownInstrumentName_1.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST143_0347_10.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST143_0347_10.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST143_0347_10.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST143_0347_10.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS6.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS6.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS7.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS7.UnknownInstrumentName_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS7.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS7.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS8.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS8.UnknownInstrumentName_1.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS8.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS8.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS9.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS9.UnknownInstrumentName_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS9.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS9.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS10.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS10.UnknownInstrumentName_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0141_2.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0163_6.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0163_6.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0163_6.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0163_6.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS10.HWI-ST486_0061_5.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS10.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS11.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS11.UnknownInstrumentName_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.HWI-ST225_0194_9.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS11.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS11.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"