#!/bin/sh
#$ -N Satsuma2_Ind_Synteny
#$ -j Y
#$ -cwd
#$ -t 1
#$ -l node_type=nxv
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=10G

module load gcc/7.1.0
module load cmake/3.16.0

Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
Ref_Gynogene=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/All_Contigs_Ind
Tool=/data/home/btx316/privatemodules/satsuma2/bin
OUT_DIR=/data/scratch/btx316/Comp_Genomics/08_Satsuma2/02_IndContigs_Satsuma2

export SATSUMA2_PATH=~/privatemodules/satsuma2/bin

date
contig_file=`sed ${SGE_TASK_ID}"q;d" $Ref_Gynogene/01_File_List.txt`
echo $contig_file

rm -r $OUT_DIR/"$contig_file"
mkdir $OUT_DIR/"$contig_file" && cd $OUT_DIR/"$contig_file"

$Tool/SatsumaSynteny2 -km_mem 20 -sl_mem 12 -slaves 4 -threads 1 -q $Ref_Gynogene/"$contig_file" -t $Ref_Peichel/Gac-HiC_revised_genome_assembly.fasta -o $OUT_DIR/"$contig_file"

echo "Done"
date