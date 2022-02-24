1. Untar/unzip in your scratch dir:
	gmes_linux_64.tar.gz
	gm_key_64.gz
   Move the "gm_key_64" inside the "gmes_linux_64" directory.

2. Change the path for "gmhmme3" and "probuild" tool within the "maker_exe.ctl" file to match your directory for this tool

3. For the maker_opts.ctl file do this 
First:
A. cp /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MySecondRunChunks/MAKER/Gynogen_pchrom_assembly_allnoUnM.fasta /to/your/MAKER/path/
B. cp /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MyFirstRunChunks/Gy_all.maker.output/Gy_allnoUnM_rd1.maker.est2genome.gff /to/your/MAKER/path/
C. cp /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MyFirstRunChunks/Gy_all.maker.output/Gy_allnoUnM_rd1.maker.protein2genome.gff /to/your/MAKER/path/
D. cp /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MyFirstRunChunks/Gy_all.maker.output/Gy_allnoUnM_rd1.maker.repeats.gff /to/your/MAKER/path/
E. cp /data/scratch/mpx493/Chromosome_Annotation2020/chunks/MySecondRunChunks/snap/chrAllnoUnM_round1/Gy_allnoUnM_rnd1.zff.length50_aed0.25.hmm /to/your/MAKER/path/

Then:
Change accordingly lines:
2: genome=/new/path/A
18: est=/new/path/B
23: protein_gff=/new/path/C
29: rm_gff=/new/path/D
34: snaphmm=/new/path/E

4. For the bash script do the following:
cp -r /data/scratch/mpx493/Chromosome_Annotation2020/BUSCO2/Augustus-master /to/your/MAKER/path/
Change line 25 within the "run_maker_ab.initio2.sh" file to match the new path as follow:
export AUGUSTUS_CONFIG_PATH=/to/your/new/Augustus-master/path
Change lines 3, 12, to match your directories

5. I think that's all. If you get any error please let me know, maybe I forget sth. Just run it first using these params:
#!/bin/bash
#$ -N mkRdIIc
#$ -o /new/dir
#$ -pe smp 1
#$ -cwd
#$ -j y
#$ -l h_vmem=12G
#$ -l h_rt=24:0:0

ADD the command

maker $SCRIPTS/maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl


If it works then change the bash scripts with:
#!/bin/bash
#$ -N mkRdIIc
#$ -o /new/dir
#$ -pe smp 8
#$ -cwd
#$ -j y
#$ -l h_vmem=12G
#$ -l h_rt=240:0:0

ADD the command

mpiexec -np 8 maker maker_opts.ctl $SCRIPTS/maker_bopts.ctl $SCRIPTS/maker_exe.ctl
