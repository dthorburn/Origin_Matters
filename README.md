# Origin Matters: A Local Reference Genome Improves Measures of Population Genomics
## Overview

This is a repository for the future publication investigating the effect of a local reference genome on metrics commonly used in population genomics - Tajima's _D_, π, _F_<sub>ST</sub>, CpG, and SVs. In addition, we released a contig and pseudo-chromosome level assemblies generated from a [European 2nd generation gynogen](https://link.springer.com/article/10.1186/1471-213X-11-55) fish.

---

### Abstract
Whole genome sequencing enables to ask fundamental questions about genomics of adaptation, population structure, and epigenetics mechanisms. The increasing availability of reference genomes has seen improvement in taxonomic coverage and overall quality. Hence, the challenge soon facing researchers will be to determine which available reference genome best suits their needs. By comparing a novel gynogenetic genome of a European three-spined stickleback (Gasterosteus aculeatus) with a published reference genome of a North American stickleback, we investigated the impact of using a local versus a differentiated reference genome on several commonly used metrics in population genomics. Through mapping 60 resequenced stickleback genomes from across Europe and North America, we confirmed genome quality is an important factor in choosing a reference genome. Interestingly, a local reference genome did offer increased mapping efficiencies and genotyping accuracy, likely stemming from the observed decrease in missing genotypes. Despite comparable distributions of the metrics generated across the genome using SNP data (i.e., π, Tajima’s D, and FST), window-based statistics identified different enriched gene functions. In contrast, the marker-based DNA methylation analysis had a considerably higher overlap in outlier genes and functions when using different reference genomes. Overall, our results highlight how using a local reference genome can increase the resolution of genome scans when multiple similar quality reference genome are available. Such results have implications in the detection of signatures of selection. 

---

### Analyses
Below are the analyses and a brief description in the order in which they were conducted for this study:
#### 01_Reference_Genome_Assembly
#### 02_Maker_Annotation
Annotating the reference genome using Maker v2.31.9
#### 03_Prepare_Reference_Genomes
Preparation of reference genomes for variant calling. 
#### 04_FastQC
QC of reads used in the compararative genomic analyses.  
#### 05_Trimming
Trimming paired end fastq files using trimmomatic v0.36.
#### 06_Mapping
Mapping reads the each reference genome using bwa v0.7.15.
#### 07_Coverage_Stats
Generation of genome wide-coverage data using BEDtools genomecov.
#### 08_GATK_Variant_Call
Variant calling using GATK v4.1.6.0 following the [best practises workflow](https://gatk.broadinstitute.org/hc/en-us/articles/360035535932-Germline-short-variant-discovery-SNPs-Indels) for germline SNPs
#### 09_Structural_Variants
Structural variation analysis using Lumpy and Delly. A consensus call was made among the two SV callers using SURVIVOR. 
#### 10_Satsuma2_Synteny
A genome-wide synteny analysis using Satsuma2. 
#### 11_Synteny_Check_Fragmentation
An unreported test to check the quality of the assembly by breaking contigs from the gynogene reference genome into chunks of multiple sizes and then rerunning the synteny anlysis to see if some contigs place in different linkage groups. 
#### 12_Circos_Visualise
Visualisation of genome-wide synteny using Circos. 
#### 13_Heterozygosity_est
Estimations of the remaining genome-wide heterozygosity in the gynogenetic reference genome. 
#### 14_BS_Hetero_Est
Estimations of the zygosity in the Big Screen genomes using a custom R script. 
#### 15_PopGenome_Scan
Genome scans for Fst and Tajima's D using the R package [PopGenome](https://cran.r-project.org/web/packages/PopGenome/vignettes/An_introduction_to_the_PopGenome_package.pdf). 
#### 16_RAxML_Phylogeny
Creating a phylogenetic tree to confirm the phylogenetic relationship between the reference genomes and the mapped samples.
#### 17_MappingEfficiency
Generation of the maping efficiency dataset using Bamtools
#### 18_OrthoFinder
Identification of all orthologous genes among the two reference genome assemblies using OrthoFinder
#### 19_GO_Enrichment
A gene ontology enrichment analysis on outlier genes using the R library [g:Profiler2](https://CRAN.R-project.org/package=gprofiler2). 
