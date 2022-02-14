#!/bin/bash
#$ -N mkRdIIc
#$ -o /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MySecondRunChunks/MAKER/MAKER.noTRNA
#$ -pe smp 8
#$ -cwd
#$ -j y
#$ -l h_vmem=12G
#$ -l h_rt=240:0:0

module load maker/2.31.9-mpi

OUTDIR=/data/scratch/mpx493/Chromosome_Annotation2020/chunks/MySecondRunChunks/MAKER/MAKER.noTRNA
#SCRIPTS=/data/scratch/mpx493/Chromosome_Annotation2020/chunks/MySecondRunChunks/MAKER
#FIRST_RUN=/data/scratch/mpx493/Chromosome_Annotation2020/chunks/MyFirstRunChunks/Gy_allnoUnM.maker.output

#cd $FIRST_RUN
## transcript alignments
#awk '{ if ($2 == "est2genome") print $0 }' Gy_allnoUnM_rd1.maker.noseq.gff > Gy_allnoUnM_rd1.maker.est2genome.gff
## protein alignments
#awk '{ if ($2 == "protein2genome") print $0 }' Gy_allnoUnM_rd1.maker.noseq.gff > Gy_allnoUnM_rd1.maker.protein2genome.gff
## repeat alignments
#awk '{ if ($2 ~ "repeat") print $0 }' Gy_allnoUnM_rd1.maker.noseq.gff > Gy_allnoUnM_rd1.maker.repeats.gff

cd $OUTDIR
export AUGUSTUS_CONFIG_PATH=/data/scratch/mpx493/Chromosome_Annotation2020/BUSCO2/Augustus-master/config
#mpiexec -np 10 maker maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl
#maker maker_opts.ctl maker_bopts.ctl maker_exe.ctl