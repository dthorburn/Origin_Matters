#!/bin/bash
#$ -N Fasta_Alignments
#$ -j Y
#$ -cwd
#$ -t 5-6
#$ -pe smp 3
#$ -l highmem
#$ -l h_rt=1:00:00
#$ -l h_vmem=100G

module load mafft
module load muscle

date
File=`sed ${SGE_TASK_ID}"q;d" /data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/12_Satsuma2_Synteny/07_File_list.txt`
echo $File

OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/03_Synteny/01_Manual_Synteny_Alignments/aligned

mafft_name=`basename $File | sed -e "s/.fasta/_mafft_aln.fasta/"`
#muscle_name=`basename $File | sed -e "s/.fasta/_muscle_aln.fasta/"`

mafft --localpair --maxiterate 100 $File	 > $OUT_DIR/"$mafft_name"

echo "Done with Mafft"

#muscle -in $File -out $OUT_DIR/muscle/"$muscle_name"

#echo "Done with Muscle"
date