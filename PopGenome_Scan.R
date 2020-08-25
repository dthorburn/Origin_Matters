suppressMessages(library(dplyr))
suppressMessages(library(stringr))
suppressMessages(library(PopGenome))
suppressMessages(library(data.table))

Genome <- commandArgs(trailingOnly=TRUE)
origin <- tolower(Genome)

## Setting the window size parameter
window_size <- 20000

chrom_lengths <- read.table("Contig_size.txt")[,1:2]

## Loop to run through the 2 levels of analysis required.
#for(level in c("population", "population_pair")){
for(level in c("population", "population_pair")[2]){
	if(level == "population"){
		## Population level
		pop_names <- list(	
				G1_R <- c(paste0("BS",seq(1,11,2))), 
				G1_L <- c(paste0("BS",seq(2,12,2))), 
				G2_R <- c(paste0("BS",seq(13,23,2))), 
				G2_L <- c(paste0("BS",seq(14,24,2))), 
				US_R <- c(paste0("BS",seq(31,41,2))),
				US_L <- c(paste0("BS",seq(32,42,2))), 
				CA_R <- c(paste0("BS",seq(43,53,2))), 
				CA_L <- c(paste0("BS",seq(44,54,2))),
				NO_R <- c(paste0("BS",seq(55,65,2))))
				NO_L <- c(paste0("BS",seq(56,66,2))), 
		names(pop_names) <- c("G1_R", "G1_L", "G2_R", "G2_L", "US_R", "US_L", "CA_R", "CA_L", "NO_R", "NO_L")
	} else if(level == "population_pair"){
		pop_names <- list(	
        G1 <- c(paste0("BS", seq(1,12,1))), 
				G2 <- c(paste0("BS", seq(13,24,1))), 
				US <- c(paste0("BS", seq(31,42,1))), 
				CA <- c(paste0("BS", seq(43,54,1))), 
				NO <- c(paste0("BS", seq(55,66,1))))
		names(pop_names) <- c("G1", "G2", "US", "CA", "NO")
	}
	## Nested loop that calculates everything for a population one chromosome at a time. 
	for(population in names(pop_names)){
		cat(paste0("Starting analysis on: ", population, ": ", date(), "\n"))
		for(chrom in c(1:18,20:22)){
			
			if(origin == "gynogene"){
				chr_prefix <- "Gy_"
			} else if(origin == "peichel"){
				chr_prefix <- ""
			}
			
			if(chrom != 22){
				r.chrom <- paste0(chr_prefix, "chr",as.roman(chrom))
			} else {
				r.chrom <- paste0(chr_prefix, "chr","Un")
			}
			
			cat(paste("Processing", origin, r.chrom, "\n"))
			
			## Creating an input file name 
			input1 <- paste0("All_",r.chrom,"_",origin,"_SNPs_Filtered_Selected.vcf.gz")

			## Reading in the VCF file with all of the individuals in a population only  
			chrom_end <- chrom_lengths[grep(pattern = paste0(r.chrom, "$"), chrom_lengths[,1]),2]
			pop.calls <- readVCF(input1, frompos = 1, topos = chrom_end, tid = r.chrom, numcols = 5000000, samplenames = pop_names[[population]])

			## Transform genome into sliding windows; width==jump for non-overlapping, and type = 2 for all sites, type = 1 is just segregating sites
			sliding_window <- sliding.window.transform(pop.calls, width = window_size, jump = window_size, type = 2)

			## Obtaining the requisite statistics from each of the tests
			test1 <- neutrality.stats(sliding_window)
			test2 <- diversity.stats(sliding_window, pi = TRUE, keep.site.info = FALSE)
			results1 <- as.data.frame(get.neutrality(test1, theta = TRUE)[1]);	results1 <- tibble::rownames_to_column(results1, var = "Window_Start_Finish")
			results2 <- as.data.frame(get.diversity(test2)[[1]]);	results2 <- tibble::rownames_to_column(results2, var = "Window_Start_Finish")

			## Saving all the useful information in a data frame
			all.results <- data.table( 	Chr = rep(as.character(chrom), nrow(results2)),
										Population = rep(as.character(population), nrow(results2)),
										Tajima_D = as.numeric(results1$Tajima.D),
										N_Sites = as.numeric(results1$n.segregating.sites),
										Watterson = as.numeric(results1$theta_Watterson)/window_size,
										Achaz_Watterson = as.numeric(results1$theta_Achaz.Watterson),
										FuLi_D = as.numeric(results1$Fu.Li.D),
										FuLi_F = as.numeric(results1$Fu.Li.F),
										Pi = as.numeric(results2$Pi)/window_size,
										Window_Start_Finish = results2$Window_Start_Finish,
										Window_Start = results2$Window_Start_Finish %>% str_extract(pattern = "^[0-9]+"),
										Window_End = results2$Window_Start_Finish %>% gsub(pattern = "^[0-9]+ - ", "", .) %>% str_extract(pattern = "^[0-9]+"),
										Window_Width = rep(window_size, nrow(results2)),
										Step_Size = rep(window_size, nrow(results2)),
										Reference = rep(origin, nrow(results2)))

			## If it is population pair level, then it additionally calculates FST
			if(level == "population_pair"){
				pop.1 <- get(population)[seq(1,11,2)]
				pop.2 <- get(population)[seq(2,12,2)]
				pop.calls2 <- set.populations(pop.calls, list(pop.1, pop.2))
				sliding_window2 <- sliding.window.transform(pop.calls2, width = window_size, jump = window_size, type = 2)
				sliding_window2 <- diversity.stats(sliding_window2, pi = TRUE)
				test3 <- F_ST.stats(sliding_window2, mode = "nucleotide")
				test4 <- get.diversity(test3, between = T)[[2]]
				all.results[,"FST" := test3@nucleotide.F_ST]
				all.results[,"DXY_Raw" := test4 ]
				all.results[,"DXY" := test4/window_size ]
			}

			## Iteratively binding output into a single file
			if(chrom == 1){
				output <- all.results
			}	else	{
				output <- rbind(output, all.results)
			}	

			## Writing output if it's the last iteration per chromosome
			if(chrom == 22){
				fwrite(output, file = paste("/data/scratch/Comp_Genomics/12_PopGenome_Scan/01_Raw_Results/All", origin, population, level, "scan_wDXY_20kb.csv", sep = "_"), row.names = FALSE)
				cat(paste("All done for ", origin, level, population, "\n"))
				rm(output)
			}
			rm(all.results, test1, test2, test3, test4, results1, results2, sliding_window, pop.calls, pop.calls2, input1)
		}
	}
}
