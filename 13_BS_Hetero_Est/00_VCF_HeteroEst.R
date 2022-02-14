###########################################################################
#		Generate Zygosity tables from vcfs									
###########################################################################
## Date: 11/05/2020
## Involved: Miles
## Task: Parse an unphased VCF file for it's genotype information to generate a table of heterozygosity information
## Note: This has not been tested on Phased genotype data. It should work, but check the format of the gt field
## 	 in vcfR objects to make sure there are no other numbers present.

suppressMessages(library(vcfR))
suppressMessages(library(dplyr))
suppressMessages(library(stringr))
suppressMessages(library(data.table))

Genome <- commandArgs(trailingOnly=TRUE)
reference <- tolower(Genome)
vcf_dir <- paste0("/data/archive/archive-SBCS-EizaguirreLab/Miles/Local_Reference_Genome/01_VCFs/02_Filtered/", Genome)

## Create a population dataframe, could also use a reference panel. What you need ultimately is a vector with the column 
## names in the vcf for your vcf for each population. Alternatively, you could split your VCFs prior to this step. 
Population_list <- data.frame(  CA_L=c("BS44", "BS46", "BS48", "BS50", "BS52", "BS54"), 
								CA_R=c("BS43", "BS45", "BS47", "BS49", "BS51", "BS53"), 
								G1_L=c("BS2", "BS4", "BS6", "BS8", "BS10", "BS12"), 
								G1_R=c("BS1", "BS3", "BS5", "BS7", "BS9", "BS11"), 
								G2_L=c("BS14", "BS16", "BS18", "BS20", "BS22", "BS24"), 
								G2_R=c("BS13", "BS15", "BS17", "BS19", "BS21", "BS23"), 
								NO_L=c("BS56", "BS58", "BS60", "BS62", "BS64", "BS66"), 
								NO_R=c("BS55", "BS57", "BS59", "BS61", "BS63", "BS65"), 
								US_L=c("BS32", "BS34", "BS36", "BS38", "BS40", "BS42"), 
								US_R=c("BS31", "BS33", "BS35", "BS37", "BS39", "BS41"))

Zygosity_Gen <- function(vcf_obj, population_ID){
	output <- data.table(CHR = vcf_obj@fix[,"CHROM"], POS = vcf_obj@fix[,"POS"] %>% as.integer(), 
			     		ID = paste(vcf_obj@fix[,"CHROM"], vcf_obj@fix[,"POS"], sep = "|"),
						  REF = vcf_obj@fix[,"REF"], 
			     		ALT = vcf_obj@fix[,"ALT"],
			     		POP = population_ID,
							HomRef 		= vcf_obj@gt[,as.character(Population_list[,population_ID])] %>% as.data.frame() %>% apply(MARGIN = 2, FUN = str_extract, pattern = "^./.") %>% 
								as.data.frame() %>% apply(MARGIN = 1, FUN = paste, collapse = "|") %>% str_count(., pattern = "0/0"),
							HomNonRef 	= vcf_obj@gt[,as.character(Population_list[,population_ID])] %>% as.data.frame() %>% apply(MARGIN = 2, FUN = str_extract, pattern = "^./.") %>% 
							as.data.frame() %>% apply(MARGIN = 1, FUN = paste, collapse = "|") %>% str_count(., pattern = "1/1|2/2|3/3|4/4"),
							HetRefNon 	= vcf_obj@gt[,as.character(Population_list[,population_ID])] %>% as.data.frame() %>% apply(MARGIN = 2, FUN = str_extract, pattern = "^./.") %>% 
							as.data.frame() %>% apply(MARGIN = 1, FUN = paste, collapse = "|") %>% str_count(., pattern = "0/[1-4]|[1-4]/0"),
							HetNonNon 	= vcf_obj@gt[,as.character(Population_list[,population_ID])] %>% as.data.frame() %>% apply(MARGIN = 2, FUN = str_extract, pattern = "^./.") %>% 
							as.data.frame() %>% apply(MARGIN = 1, FUN = paste, collapse = "|") %>% str_count(., pattern = "1/[234]|2/[134]|3/[124]|4/[123]"),
							Missing 	= vcf_obj@gt[,as.character(Population_list[,population_ID])] %>% as.data.frame() %>% apply(MARGIN = 2, FUN = str_extract, pattern = "^./.") %>% 
							as.data.frame() %>% apply(MARGIN = 1, FUN = paste, collapse = "|") %>% str_count(., pattern = "\\./\\.|NA"))
	return(output)
}

for(chrom in 1:22){
	start_time <- Sys.time(); if(chrom == 1){ult_start <- Sys.time()}
	if(reference == "gynogene"){
	 	chr_prefix <- "Gy_"
	} else if(reference == "peichel"){
		chr_prefix <- ""
	}
  if(chrom != 22){
		temp_chrom <- read.vcfR(paste(vcf_dir,"/All_", chr_prefix, "chr", as.roman(chrom),"_", reference, "_SNPs_Filtered_Selected.vcf.gz", sep = ""), verbose = FALSE)
	} else if(chrom == 22){ 
		temp_chrom <- read.vcfR(paste(vcf_dir,"/All_", chr_prefix, "chrUn_", reference, "_SNPs_Filtered_Selected.vcf.gz", sep = ""), verbose = FALSE)
	}
	checkpoint <- Sys.time(); print(checkpoint - start_time)
	for(pops in names(Population_list)){
		if(pops != "DE_M"){
			print(paste("Starting extraction for", pops))
			## This is my attempt to not load and reloading the list objects. If the datasets are really large, this may cause R to crash by loading to much into the environment.
			## Alternatively, you could save each output as an RData file and then reload it, but it's a lot of wasted memory
			## allocation. 
			if(chrom == 1){
				temp_list <- list()
				assign(pops, temp_list)
			}	else	{
				temp_list <- get(pops)
			}
			temp_list[[chrom]] <- Zygosity_Gen(temp_chrom, pops)
			checkpoint2 <- Sys.time(); print(checkpoint2 - checkpoint); print(paste("from start of Chr", chrom, sep = ""))
			assign(pops, temp_list)
			## saving the output
			if(chrom == 22){
				save(temp_list, file = paste("All_Autosome", pops, reference, "Zygosity.RData", sep = "_"))
				print(paste("Saved output for", pops))
			}
			## Binding all chromosomes and populations into a single object
			if(chrom == 22 & pops == names(Population_list)[10]){
				for(i in names(Population_list)){
					if(i == names(Population_list)[1]){
						final_out <- names(Population_list)[i] %>% get() %>% rbindlist
					} else {
						temp_out <- names(Population_list)[i] %>% get() %>% rbindlist
						final_out <- rbind(final_out, temp_out)
					}
				}
				fwrite(file = paste0("All_genome_zygosity_", reference, ".csv"), final_out)
			}
		}
	}
## Just a timer to see how long the entire data set took to process
if(chrom == 22){ult_end <- Sys.time(); print(ult_end - ult_start)}
}