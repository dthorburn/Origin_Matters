#!/bin/bash
#$ -N X06_Merging_2
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

newname="BS12.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS12.UnknownInstrumentName_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_12.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_13.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS12.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS12.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS13.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS13.HWI-ST143_0336_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS13.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS13.HWI-ST143_459_C077DACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS14.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS14.UnknownInstrumentName_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS14.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS14.HWI-ST143_459_C077DACXX_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS15.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS15.UnknownInstrumentName_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.HWI-ST225_0231_14.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS15.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS15.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS16.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS16.UnknownInstrumentName_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.HWI-ST225_0194_9.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.HWI-ST225_0194_9.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS16.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS16.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS17.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS17.UnknownInstrumentName_1.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.HWI-ST225_0194_9.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.HWI-ST486_0105_15.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.HWI-ST486_0105_15.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.HWI-ST486_0105_15.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS17.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS17.HWI-ST225_369_D0JEPACXX_2.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS17.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS18.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS18.UnknownInstrumentName_1.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.HWI-ST225_0194_9.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.HWI-ST225_0194_9.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.HWI-ST225_0194_9.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_11.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_13.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS18.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS18.HWI-ST486_212_D0C8BACXX_1.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS19.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS19.UnknownInstrumentName_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.HWI-ST143_0369_16.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.HWI-ST225_0194_9.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.HWI-ST225_0194_9.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.HWI-ST486_0105_15.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS19.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS19.HWI-ST486_212_D0C8BACXX_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS20.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS20.UnknownInstrumentName_1.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.HWI-ST225_0192_8.Lane_8_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.UnknownInstrumentName_4.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.UnknownInstrumentName_4.Lane_2_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.UnknownInstrumentName_4.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.UnknownInstrumentName_4.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS20.UnknownInstrumentName_4.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS20.HWI-ST486_212_D0C8BACXX_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS21.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS21.UnknownInstrumentName_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.HWI-ST225_0141_2.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.HWI-ST486_0064_7.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.HWI-ST486_0064_7.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.UnknownInstrumentName_13.Lane_1_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.UnknownInstrumentName_4.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS21.UnknownInstrumentName_4.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS21.HWI-ST486_212_D0C8BACXX_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"

newname="BS22.cleaned.sorted.merged."${Genome,,}".bam"
echo $newname
gatk MergeSamFiles \
  -I $DATA_DIR/NG-5241_4kb.BS22.UnknownInstrumentName_1.Lane_5_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.HWI-ST225_0141_2.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.HWI-ST225_0194_9.Lane_4_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.HWI-ST486_0064_7.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.HWI-ST486_0064_7.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.UnknownInstrumentName_4.Lane_6_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-5241_STD.BS22.UnknownInstrumentName_4.Lane_7_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -I $DATA_DIR/NG-6005_STD.BS22.HWI-ST486_212_D0C8BACXX_1.Lane_3_"${Genome,,}"_aligned_FixMate_CleanSam.bam \
  -O $OUTDIR/"$newname"