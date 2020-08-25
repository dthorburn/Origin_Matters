# Origin Matters: A Local Reference Genome Improves Measures of Population Genomics
## Overview

This is a repository for the future publication investigating the effect of a local reference genome on metrics commonly used in population genomics - Tajima's _D_, π, _F_<sub>ST</sub>, CpG, and SVs. In addition, we released a contig and pseudo-chromosome level assemblies generated from a [European 2nd generation gynogen](https://link.springer.com/article/10.1186/1471-213X-11-55) fish.

## Structural Variants

We used a combination of [Delly2](https://github.com/dellytools/delly) and [LumpyExpress](https://github.com/arq5x/lumpy-sv) to detect genomic structural variants, and [SURVIVOR](https://github.com/fritzsedlazeck/SURVIVOR) to merge SVs with a 50% reciprocal overlap, and [Duphold](https://github.com/brentp/duphold) to annotate SVs with depth information. The script ```Parse_Genomic_SVs.R``` contains the workflows I wrote to (i) parse SV VCFs to extract a table of SVs, and (ii) identify the SVs found in multiple individuals and populations. 

## GO Enrichment Analysis

The enrichment analysis was conducted using the script ```GO_Enrichment_Analysis.R```, and used the library [g:Profiler2](https://CRAN.R-project.org/package=gprofiler2) to test for functional enrichment. 

## Diversity Statistics and Outlier Genes

The genome-wide diversity statistics were calculated using the [PopGenome](https://cran.r-project.org/web/packages/PopGenome/vignettes/An_introduction_to_the_PopGenome_package.pdf) package from the bioconductor project. The ```PopGenome_Scan.R``` script is an example of the genome scan I conducted, as well as how I detected outlier genes.
