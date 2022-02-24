##########################################################################################################
##																										##
##								Local Reference Genome: Parse SV Call									##
##																										##
##########################################################################################################
## Date: 02/07/2020
## Involved: Miles
## Chapter: 4
## Task:	Parse output of LUMPY SV call to a csv and combine all together. 
## 	

suppressMessages(library(data.table))
suppressMessages(library(stringr))
suppressMessages(library(dplyr))
suppressMessages(library(vcfR))

Pop_list <- data.table(Population = c(rep("G1_R", 6), rep("G1_L", 6), rep("G2_R", 6), rep("G2_L", 6),
									  rep("US_R", 6), rep("US_L", 6), rep("CA_R", 6), rep("CA_L", 6),
									  rep("NO_R", 6), rep("NO_L", 6)),
						ID = c(paste0("BS",seq(1,11,2)), paste0("BS",seq(2,12,2)), paste0("BS",seq(13,23,2)), paste0("BS",seq(14,24,2)),
								paste0("BS",seq(31,41,2)), paste0("BS",seq(32,42,2)), paste0("BS",seq(43,53,2)), paste0("BS",seq(44,54,2)),
								paste0("BS",seq(55,65,2)), paste0("BS",seq(56,66,2))))

SVCF_Parse <- function(file_in){
	vcf_obj <- read.vcfR(file = file_in, verbose = TRUE)
	Fish_ID <- str_extract(pattern = "BS[0-9]+", file_in)
	output <- data.table( 	Chr = vcf_obj@fix[,"CHROM"] %>% gsub(pattern = "Gy_", "", .),
							ID = Fish_ID,
							Population = Pop_list[grep(pattern = paste0(Fish_ID, "$"), Pop_list$ID),"Population"] %>% as.character,
							Ref_Origin = ifelse(grepl(pattern = "Gy", vcf_obj@fix[,"CHROM"]), "Europe", "NorthAmerica"),
							SV_Type = vcf_obj@fix[,"ALT"] %>% str_extract("[A-Z]{3}"),
							Start = vcf_obj@fix[,"POS"] %>% as.numeric(),
							End = vcf_obj@fix[,"INFO"] %>% str_extract(";END=[0-9]+") %>% gsub(pattern = ";END=", "", .) %>% as.numeric,
              QUAL = vcf_obj@fix[,"QUAL"] %>% as.numeric,
							Genotype = vcf_obj@gt[,Fish_ID] %>% gsub("\\:.*","",.),
              Raw_Genotype = vcf_obj@gt[,Fish_ID] %>% gsub("\\:.*","",.),
							#DP = extract.gt(vcf_obj, element = "DP") %>% as.numeric,
              #AltObsTot = extract.gt(vcf_obj, element = "AO") %>% as.numeric,
              #AltObsPair = extract.gt(vcf_obj, element = "AP") %>% as.numeric,
              #AltObsSplit = extract.gt(vcf_obj, element = "AS") %>% as.numeric,
              #AltObsClipped = extract.gt(vcf_obj, element = "ASC") %>% as.numeric,
              DupholdSuppReads = extract.gt(vcf_obj, element = "DHSP") %>% as.numeric,
              DepthFoldChange = extract.gt(vcf_obj, element = "DHFC") %>% as.numeric,
              DepthFlankFChange = extract.gt(vcf_obj, element = "DHFFC") %>% as.numeric)
#							SU = vcf_obj@fix[,"INFO"] %>% str_extract("SU=[0-9]+") %>% gsub(pattern = "SU=", "", .) %>% as.numeric)
	output[,"SV_Length" := abs(Start - End)]
#  output[,"AltObsSplCliTotal" := abs(AltObsSplit + AltObsClipped)]
	output2 <- mutate(output, Genotype = ifelse(grepl("1/1", Genotype), "Hom", ifelse(grepl("0/0", Genotype), "Ref", "Het")))
	return(output2)
}

vcf <- commandArgs(trailingOnly=TRUE)[1]
out <- commandArgs(trailingOnly=TRUE)[2]
cat(paste0("Starting analysis on ", vcf, ": ", date(), "\n"))
cat(paste0(str_extract(pattern = "BS[0-9]+", vcf), "\n"))
temp_chr <- SVCF_Parse(vcf)
fwrite(file = paste0("/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/01_Scripts/09_Lumpy_CNV/06_New_Pipeline_Whole/20_SVCF_Results/", out), temp_chr)

cat("All done in R\n")