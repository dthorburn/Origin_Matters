#!/bin/sh
#$ -N Fragmentation_Synteny_Test
#$ -j Y
#$ -cwd
#$ -t 8-9
#$ -tc 10
#$ -l avx2
#$ -pe smp 1
#$ -l h_rt=90:00:00
#$ -l h_vmem=6G

date

module load emboss
module load samtools/1.8
module load gcc/7.1.0
#module load cmake/3.16.0

export SATSUMA2_PATH=~/privatemodules/satsuma2/bin

Ref_Peichel=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
Ref_Gynogene=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome/All_Contigs_Ind
SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/12B_Synteny_Check_Fragmentation
OUT_DIR=/data/scratch/btx316/Comp_Genomics/10_Frag_Analysis
Tool=/data/home/btx316/privatemodules/satsuma2/bin

  ## Extracting the top 10 of the N50 contigs - N50 is 160 contigs.
contig=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/01_Contig_List.txt`
echo $contig

## Identifying the length of the fasta sequence, then changing the size of the loop for the sizes that need to be tested. 
contig_size=`awk '/^>/{if (l!="") print l; print; l=0; next}{l+=length($0)}END{print l}' $Ref_Gynogene/"$contig".fa |paste - - |cut -f 2`
if (( contig_size > 100000 )); then chunks="100000 80000 60000 40000 20000 10000"
elif (( contig_size > 80000 )); then chunks="80000 60000 40000 20000 10000"
elif (( contig_size > 60000 )); then chunks="60000 40000 20000 10000"
elif (( contig_size > 40000 )); then chunks="40000 20000 10000"
elif (( contig_size > 20000 )); then chunks="20000 10000"
elif (( contig_size > 10000 )); then chunks="10000"; fi

#chunks="40000 20000 10000"

## Loop to run through each of the following sizes. 
for chunk_size in $chunks
do
  echo "Starting analysis for "$chunk_size

  ## Making the new output directory
  mkdir $OUT_DIR/"$contig"_"$chunk_size"
  rm -r $OUT_DIR/"$contig"_"$chunk_size"/*
  cd $OUT_DIR/"$contig"_"$chunk_size"

  ## Fragmenting the sequence by the chunk size variable. 
  splitter -sequence $Ref_Gynogene/"$contig".fa -size $chunk_size -outseq $OUT_DIR/"$contig"_"$chunk_size"/"$contig"_"$chunk_size".fa
  samtools faidx $OUT_DIR/"$contig"_"$chunk_size"/"$contig"_"$chunk_size".fa

  ## Running the synteny analysis for said contig
  $Tool/SatsumaSynteny2 -km_mem 15 -sl_mem 4 -slaves 2 -threads 1 -q $OUT_DIR/"$contig"_"$chunk_size"/"$contig"_"$chunk_size".fa -t $Ref_Peichel/Gac-HiC_revised_genome_assembly.fasta -o $OUT_DIR/"$contig"_"$chunk_size"
  rsync -alvzh $OUT_DIR/"$contig"_"$chunk_size"/satsuma_summary.chained.out $SCRIPT/Results/"$contig"_"$chunk_size".out
  
  echo "Done for "$chunk_size
  date
done