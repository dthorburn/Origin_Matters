#!/bin/bash
#$ -N x06_Synteny_Alignment_Checks
#$ -j Y
#$ -cwd
#$ -t 1
#$ -pe smp 1
#$ -l h_rt=4:00:00
#$ -l h_vmem=6G

module load samtools

PEICHEL_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
GYNOGENE_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/03_Synteny/01_Manual_Synteny_Alignments/raw
ALN_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/03_Synteny/01_Manual_Synteny_Alignments/aligned
date

#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1196       	>	$OUT_DIR/chrUn_1196_tig00001479_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001479_pilon	                  >>	$OUT_DIR/chrUn_1196_tig00001479_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1200       	>	$OUT_DIR/chrUn_1200_tig00001476_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001476_pilon	                  >>	$OUT_DIR/chrUn_1200_tig00001476_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1320       	>	$OUT_DIR/chrUn_1320_tig00001521_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001521_pilon	                  >>	$OUT_DIR/chrUn_1320_tig00001521_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1559       	>	$OUT_DIR/chrUn_1559_tig00000984_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000984_pilon	                  >>	$OUT_DIR/chrUn_1559_tig00000984_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1684       	>	$OUT_DIR/chrUn_1684_tig00000168_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000168_pilon	                  >>	$OUT_DIR/chrUn_1684_tig00000168_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1686       	>	$OUT_DIR/chrUn_1686_tig00000166_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000166_pilon	                  >>	$OUT_DIR/chrUn_1686_tig00000166_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_1734       	>	$OUT_DIR/chrUn_1734_tig00000441_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000441_pilon	                  >>	$OUT_DIR/chrUn_1734_tig00000441_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2099       	>	$OUT_DIR/chrUn_2099_tig00000695_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000695_pilon	                  >>	$OUT_DIR/chrUn_2099_tig00000695_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2142       	>	$OUT_DIR/chrUn_2142_tig00002836_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002836_pilon	                  >>	$OUT_DIR/chrUn_2142_tig00002836_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2144       	>	$OUT_DIR/chrUn_2144_tig00002834_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002834_pilon	                  >>	$OUT_DIR/chrUn_2144_tig00002834_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2213       	>	$OUT_DIR/chrUn_2213_tig00001247_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001247_pilon	                  >>	$OUT_DIR/chrUn_2213_tig00001247_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_25         	>	$OUT_DIR/chrUn_25_tig00001033_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001033_pilon	                  >>	$OUT_DIR/chrUn_25_tig00001033_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2529       	>	$OUT_DIR/chrUn_2529_tig00002825_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002825_pilon	                  >>	$OUT_DIR/chrUn_2529_tig00002825_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_28         	>	$OUT_DIR/chrUn_28_tig00001033_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001033_pilon	                  >>	$OUT_DIR/chrUn_28_tig00001033_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_2840       	>	$OUT_DIR/chrUn_2840_tig00000166_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000166_pilon	                  >>	$OUT_DIR/chrUn_2840_tig00000166_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_340        	>	$OUT_DIR/chrUn_340_tig00002302_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002302_pilon	                  >>	$OUT_DIR/chrUn_340_tig00002302_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_441        	>	$OUT_DIR/chrUn_441_tig00001364_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001364_pilon	                  >>	$OUT_DIR/chrUn_441_tig00001364_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_441        	>	$OUT_DIR/chrUn_441_tig00001435_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001435_pilon	                  >>	$OUT_DIR/chrUn_441_tig00001435_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_456        	>	$OUT_DIR/chrUn_456_tig00001445_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001445_pilon	                  >>	$OUT_DIR/chrUn_456_tig00001445_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_484        	>	$OUT_DIR/chrUn_484_tig00001500_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001500_pilon	                  >>	$OUT_DIR/chrUn_484_tig00001500_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_537        	>	$OUT_DIR/chrUn_537_tig00001545_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001545_pilon	                  >>	$OUT_DIR/chrUn_537_tig00001545_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_610        	>	$OUT_DIR/chrUn_610_tig00002189_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002189_pilon	                  >>	$OUT_DIR/chrUn_610_tig00002189_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_610        	>	$OUT_DIR/chrUn_610_tig00002191_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002191_pilon	                  >>	$OUT_DIR/chrUn_610_tig00002191_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_62         	>	$OUT_DIR/chrUn_62_tig00002633_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002633_pilon	                  >>	$OUT_DIR/chrUn_62_tig00002633_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_805        	>	$OUT_DIR/chrUn_805_tig00000779_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00000779_pilon	                  >>	$OUT_DIR/chrUn_805_tig00000779_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_937        	>	$OUT_DIR/chrUn_937_tig00002908_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00002908_pilon	                  >>	$OUT_DIR/chrUn_937_tig00002908_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_987        	>	$OUT_DIR/chrUn_987_tig00001550_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001550_pilon	                  >>	$OUT_DIR/chrUn_987_tig00001550_pilon.fasta
#samtools faidx $PEICHEL_DIR/Gac-HiC_revised_genome_assembly_UninContigs.fasta chrUn_987        	>	$OUT_DIR/chrUn_987_tig00001562_pilon.fasta
#samtools faidx $GYNOGENE_DIR/Gynogen_PacBio_reference.fasta tig00001562_pilon	                  >>	$OUT_DIR/chrUn_987_tig00001562_pilon.fasta

echo "Done with fasta creation"

module load mafft

#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1196_tig00001479_pilon.fasta	 > $ALN_DIR/chrUn_1196_tig00001479_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1200_tig00001476_pilon.fasta	 > $ALN_DIR/chrUn_1200_tig00001476_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1320_tig00001521_pilon.fasta	 > $ALN_DIR/chrUn_1320_tig00001521_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1559_tig00000984_pilon.fasta	 > $ALN_DIR/chrUn_1559_tig00000984_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1684_tig00000168_pilon.fasta	 > $ALN_DIR/chrUn_1684_tig00000168_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1686_tig00000166_pilon.fasta	 > $ALN_DIR/chrUn_1686_tig00000166_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_1734_tig00000441_pilon.fasta	 > $ALN_DIR/chrUn_1734_tig00000441_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2099_tig00000695_pilon.fasta	 > $ALN_DIR/chrUn_2099_tig00000695_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2142_tig00002836_pilon.fasta	 > $ALN_DIR/chrUn_2142_tig00002836_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2144_tig00002834_pilon.fasta	 > $ALN_DIR/chrUn_2144_tig00002834_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2213_tig00001247_pilon.fasta	 > $ALN_DIR/chrUn_2213_tig00001247_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_25_tig00001033_pilon.fasta	   > $ALN_DIR/chrUn_25_tig00001033_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2529_tig00002825_pilon.fasta	 > $ALN_DIR/chrUn_2529_tig00002825_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_28_tig00001033_pilon.fasta	   > $ALN_DIR/chrUn_28_tig00001033_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_2840_tig00000166_pilon.fasta	 > $ALN_DIR/chrUn_2840_tig00000166_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_340_tig00002302_pilon.fasta	 > $ALN_DIR/chrUn_340_tig00002302_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_441_tig00001364_pilon.fasta	 > $ALN_DIR/chrUn_441_tig00001364_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_441_tig00001435_pilon.fasta	 > $ALN_DIR/chrUn_441_tig00001435_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_456_tig00001445_pilon.fasta	 > $ALN_DIR/chrUn_456_tig00001445_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_484_tig00001500_pilon.fasta	 > $ALN_DIR/chrUn_484_tig00001500_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_537_tig00001545_pilon.fasta	 > $ALN_DIR/chrUn_537_tig00001545_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_610_tig00002189_pilon.fasta	 > $ALN_DIR/chrUn_610_tig00002189_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_610_tig00002191_pilon.fasta	 > $ALN_DIR/chrUn_610_tig00002191_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_62_tig00002633_pilon.fasta	   > $ALN_DIR/chrUn_62_tig00002633_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_805_tig00000779_pilon.fasta	 > $ALN_DIR/chrUn_805_tig00000779_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_937_tig00002908_pilon.fasta	 > $ALN_DIR/chrUn_937_tig00002908_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_987_tig00001550_pilon.fasta	 > $ALN_DIR/chrUn_987_tig00001550_pilon_aln.fasta
#mafft --localpair --maxiterate 1000 $OUT_DIR/chrUn_987_tig00001562_pilon.fasta	 > $ALN_DIR/chrUn_987_tig00001562_pilon_aln.fasta

module load muscle

muscle -in $OUT_DIR/chrUn_1196_tig00001479_pilon.fasta -out $ALN_DIR/chrUn_1196_tig00001479_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1200_tig00001476_pilon.fasta -out $ALN_DIR/chrUn_1200_tig00001476_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1320_tig00001521_pilon.fasta -out $ALN_DIR/chrUn_1320_tig00001521_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1559_tig00000984_pilon.fasta -out $ALN_DIR/chrUn_1559_tig00000984_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1684_tig00000168_pilon.fasta -out $ALN_DIR/chrUn_1684_tig00000168_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1686_tig00000166_pilon.fasta -out $ALN_DIR/chrUn_1686_tig00000166_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_1734_tig00000441_pilon.fasta -out $ALN_DIR/chrUn_1734_tig00000441_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2099_tig00000695_pilon.fasta -out $ALN_DIR/chrUn_2099_tig00000695_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2142_tig00002836_pilon.fasta -out $ALN_DIR/chrUn_2142_tig00002836_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2144_tig00002834_pilon.fasta -out $ALN_DIR/chrUn_2144_tig00002834_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2213_tig00001247_pilon.fasta -out $ALN_DIR/chrUn_2213_tig00001247_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_25_tig00001033_pilon.fasta -out $ALN_DIR/chrUn_25_tig00001033_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2529_tig00002825_pilon.fasta -out $ALN_DIR/chrUn_2529_tig00002825_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_28_tig00001033_pilon.fasta -out $ALN_DIR/chrUn_28_tig00001033_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_2840_tig00000166_pilon.fasta -out $ALN_DIR/chrUn_2840_tig00000166_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_340_tig00002302_pilon.fasta -out $ALN_DIR/chrUn_340_tig00002302_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_441_tig00001364_pilon.fasta -out $ALN_DIR/chrUn_441_tig00001364_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_441_tig00001435_pilon.fasta -out $ALN_DIR/chrUn_441_tig00001435_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_456_tig00001445_pilon.fasta -out $ALN_DIR/chrUn_456_tig00001445_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_484_tig00001500_pilon.fasta -out $ALN_DIR/chrUn_484_tig00001500_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_537_tig00001545_pilon.fasta -out $ALN_DIR/chrUn_537_tig00001545_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_610_tig00002189_pilon.fasta -out $ALN_DIR/chrUn_610_tig00002189_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_610_tig00002191_pilon.fasta -out $ALN_DIR/chrUn_610_tig00002191_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_62_tig00002633_pilon.fasta -out $ALN_DIR/chrUn_62_tig00002633_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_805_tig00000779_pilon.fasta -out $ALN_DIR/chrUn_805_tig00000779_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_937_tig00002908_pilon.fasta -out $ALN_DIR/chrUn_937_tig00002908_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_987_tig00001550_pilon.fasta -out $ALN_DIR/chrUn_987_tig00001550_pilon_aln.fasta
muscle -in $OUT_DIR/chrUn_987_tig00001562_pilon.fasta -out $ALN_DIR/chrUn_987_tig00001562_pilon_aln.fasta

echo "Done with alignments"

date