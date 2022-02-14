#!/bin/bash
#$ -N GATK_SelectSNPs_Gynogene
#$ -cwd
#$ -j y
#$ -l node_type=nxv
#$ -l h_rt=4:00:00
#$ -l h_vmem=12G
#$ -t 1-22

module load singularity
#module load gatk

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

#DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/04_SelectSNPs/Peichel
DATA_DIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/04_SelectSNPs/Gynogene
#OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/05_Filtering/Peichel
OUTDIR=/data/scratch/btx316/Comp_Genomics/04_GATK_Call/05_Filtering/Gynogene
#REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Peichel_Genome
REFERENCE=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/00_Ref_Genomes/Gynogene_Genome
CONTAINERS=/data/SBCS-Informatics/singularity/images
SCRIPT=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/08_GATK_Variant_Call/Gynogene/01_GATK_HC_DBI/02_DBI

#contig_num=`sed ${SGE_TASK_ID}"q;d" $SCRIPT/00_contig_list_gynogene.txt`
oldname=All_"$contig_num"_gynogene_SNPs.vcf
newname=All_"$contig_num"_gynogene_SNPs_Filtered.vcf

singularity exec $CONTAINERS/gatk-4.img \
  /opt/gatk/gatk VariantFiltration \
  -V $DATA_DIR/"$oldname" \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -O $OUTDIR/"$newname" \
  --filter-expression "QUAL < 30.0" \
  --filter-name FAIL_QUAL \
  --filter-expression "MQ < 40.0" \
  --filter-name FAIL_MQ \
  --filter-expression "SOR > 3.00" \
  --filter-name FAIL_SOR \
  --filter-expression "QD < 2.0" \
  --filter-name FAIL_QD \
  --filter-expression "FS > 60.0" \
  --filter-name FAIL_FS 
  
echo "Step 1 Done"

filtered_file=$OUTDIR/All_"$contig_num"_gynogene_SNPs_Filtered.vcf
newname2=`basename $filtered_file | sed -e "s/_Filtered.vcf/_Filtered_Selected.vcf/"`

singularity exec $CONTAINERS/gatk-4.img \
  /opt/gatk/gatk SelectVariants \
  -R $REFERENCE/Gynogen_pchrom_assembly_all.fasta \
  -V $filtered_file \
  -O $OUTDIR/"$newname2" \
  -select 'vc.isNotFiltered()'
  
echo "All done with contig "$contig_num