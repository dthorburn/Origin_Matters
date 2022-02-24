#!/bin/bash
#$ -N GATK_GenotypeGVCF_Gynogene
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=16:00:00
#$ -l h_vmem=16G
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


#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/02_DBI/Peichel/Chrom_"${SGE_TASK_ID}"/DBImport_Peichel_chr"${SGE_TASK_ID}"
DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/02_DBI/Gynogene/DBImport_Gynogene_contig${SGE_TASK_ID}
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/03_GenotypeGVCF/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
#SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI
CONTAINERS=/data/SBCS-Informatics/singularity/images

#contig_num=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_gynogene.txt`
Raw_newname=All_"$contig_num"_gynogene_raw.vcf

#singularity exec $CONTAINERS/gatk-4.img \
#  /opt/gatk/gatk GenotypeGVCFs \
gatk GenotypeGVCFs \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V gendb://$DATA_DIR \
  -O $OUTDIR/"$Raw_newname" \
  -L $contig_num 
  
echo "Done"
