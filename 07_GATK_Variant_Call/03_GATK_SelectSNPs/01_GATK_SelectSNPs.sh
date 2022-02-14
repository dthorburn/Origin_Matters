#!/bin/bash
#$ -N GATK_SelectSNPs_Gynogene
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=16:00:00
#$ -l h_vmem=12G
#$ -t 1-22

#module load singularity
module load gatk/4.1.6.0

## defining a number to roman numeral function
roman() {
    local values=( 1000 900 500 400 100 90 50 40 10 5 4 1 )
    local roman=(
        [1000]=M [900]=CM [500]=D [400]=CD 
         [100]=C  [90]=XC  [50]=L  [40]=XL 
          [10]=X   [9]=IX   [5]=V   [4]=IV   
           [1]=I
    )
    local nvmber=""
    local num=$1
    for value in ${values[@]}; do
        while (( num >= value )); do
            nvmber+=${roman[value]}
            ((num -= value))
        done
    done
    contig_num="Gy_chr$nvmber"
    ## changed the function so it saves an object at the end called $contig_num
}

echo ${SGE_TASK_ID}
roman ${SGE_TASK_ID}
if [ "$contig_num" = "Gy_chrVIV" ]  ; then contig_num="Gy_chrIX"  ; echo "$contig_num Changed from VIV"  ; fi
if [ "$contig_num" = "Gy_chrXVIV" ] ; then contig_num="Gy_chrXIX" ; echo "$contig_num Changed from XVIV" ; fi
if [ "$contig_num" = "Gy_chrXXII" ] ; then contig_num="Gy_chrUn"  ; echo "$contig_num Changed from XXII" ; fi

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Gynogene
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/04_SelectSNPs/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/04_SelectSNPs/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
CONTAINERS=/data/SBCS-Informatics/singularity/images
SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI

#contig_num=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_gynogene.txt`
input_file=$DATA_DIR/All_"$contig_num"_gynogene_raw.vcf
newname=All_"$contig_num"_gynogene_SNPs.vcf

echo ${SGE_TASK_ID}


## $REFERENCE/Gynogen_PacBio_reference.fasta 
## --allow-old-rms-mapping-quality-annotation-data \
#singularity exec $CONTAINERS/gatk-4.img \
#  /opt/gatk/gatk SelectVariants \
gatk SelectVariants \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V $input_file \
  -O $OUTDIR/"$newname" \
  --select-type-to-include SNP
  
echo "Done"
