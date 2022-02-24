#!/bin/bash
#$ -N DB_Import_GynogenePELib
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=5:00:00
#$ -l h_vmem=8G
#$ -t 23

module load gatk/4.1.6.0
#module load singularity

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/01_HC/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/01_HC
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/02_DBI/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/11_Hetero_Est/04_GATK/02_DBI
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
#CONTAINERS=/data/SBCS-Informatics/singularity/images
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI
date
echo ${SGE_TASK_ID}

## Creating new name of directory to be created for each of these files
#DB_newname="DBImport_Peichel_chr${SGE_TASK_ID}"
DB_newname="DBImport_GynogenePELib_contig${SGE_TASK_ID}"
echo $DB_newname


#contig_list=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_Gynogene.txt`
#file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf

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

mkdir $OUTDIR/Group_"${SGE_TASK_ID}"
cd $OUTDIR/Group_"${SGE_TASK_ID}"

echo $contig_num
#singularity exec $CONTAINERS/gatk-4.img \
#  /opt/gatk/gatk GenomicsDBImport  \
  gatk GenomicsDBImport  \
  -V $DATA_DIR/PELibs.cleaned.sorted.merged.gynogene.markdup.4160.g.vcf \
  --genomicsdb-workspace-path $OUTDIR/"$DB_newname" 
#  -L $contig_num

#echo "Done for Peichel: "$contig_num
echo "Done for Gynogene: "$contig_num

#  -V $DATA_DIR/BS25.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS26.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS27.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS28.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS29.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS30.cleaned.sorted.merged.Gynogene.markdup.RGUpdate.g.vcf \