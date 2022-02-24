#!/bin/bash
#$ -N DB_Import_Gynogene
#$ -j y
#$ -cwd
#$ -l node_type=nxv
#$ -l h_rt=15:00:00
#$ -l h_vmem=30G
#$ -t 1-22

module load gatk/4.1.6.0
#module load singularity

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/01_HC/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/01_HC/Gynogene
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/02_DBI/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/02_DBI/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
#CONTAINERS=/data/SBCS-Informatics/singularity/images
SCRIPTS=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI
date
echo ${SGE_TASK_ID}

## Creating new name of directory to be created for each of these files
#DB_newname="DBImport_Peichel_chr${SGE_TASK_ID}"
DB_newname="DBImport_Gynogene_contig${SGE_TASK_ID}"
echo $DB_newname


#contig_list=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_gynogene.txt`
#file=BS"${SGE_TASK_ID}".cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf

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
  -V $DATA_DIR/BS1.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS2.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS3.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS4.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS5.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS6.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS7.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS8.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS9.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS10.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS11.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS12.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS13.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS14.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS15.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS16.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS17.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS18.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS19.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS20.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS21.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS22.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS23.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS24.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS31.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS32.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS33.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS34.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS35.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS36.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS37.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS38.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS39.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS40.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS41.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS42.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS43.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS44.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS45.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS46.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS47.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS48.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS49.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS50.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS51.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS52.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS53.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS54.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS55.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS56.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS57.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS58.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS59.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS60.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS61.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS62.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS63.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS64.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS65.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  -V $DATA_DIR/BS66.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
  --genomicsdb-workspace-path $OUTDIR/"$DB_newname" \
  -L $contig_num

#echo "Done for Peichel: "$contig_num
echo "Done for Gynogene: "$contig_num

#  -V $DATA_DIR/BS25.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS26.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS27.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS28.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS29.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \
#  -V $DATA_DIR/BS30.cleaned.sorted.merged.gynogene.markdup.RGUpdate.g.vcf \