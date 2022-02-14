#!/bin/bash
#$ -N Circos_Plot
#$ -j Y
#$ -cwd
#$ -t 1-21
#$ -pe smp 1
#$ -l h_rt=0:10:00
#$ -l h_vmem=6G

module load perl/5.26.0

DATA_DIR=/data/home/btx316/privatemodules/circos-0.69-9
OUT_DIR=/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/13_Circos_Visualise

cd $DATA_DIR

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
    contig_num="chr$nvmber"
    ## changed the function so it saves an object at the end called $contig_num
}
roman ${SGE_TASK_ID}
## roman function doesn't corrently change 9 or 19 to IX or XIX (VIV/XVIV instead)
if [ "$contig_num" = "chrVIV" ] ; then contig_num="chrIX" ; echo "$contig_num Changed from VIV" ; fi
if [ "$contig_num" = "chrXVIV" ] ; then contig_num="chrXIX" ; echo "$contig_num Changed from XVIV" ; fi

## Changing the instances of chr_id in the conf file. 
rsync $OUT_DIR/circos_chrom_template.conf $OUT_DIR/circos_"$contig_num".conf
sed -i "s/chrI/"$contig_num"/g" $OUT_DIR/circos_"$contig_num".conf


./bin/circos -v
./bin/circos -conf $OUT_DIR/circos_"$contig_num".conf

mv /data/home/btx316/privatemodules/circos-0.69-9/circos_"$contig_num".png $OUT_DIR/Plots/

echo "All done with Circos"