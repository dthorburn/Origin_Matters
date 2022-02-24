library(data.table)
library(stringr)
library(dplyr)
for(file in grep(pattern = "PSC", dir(), value = TRUE)){
	print(file)
	chrom <- str_extract(pattern = "G?y?_?chr[XVI]+", file)
	temp_dat <- fread(file)[,c(3,5:6)]
	names(temp_dat) <- c("ID", "nNonRefHom", "nHets")
	temp_dat[, "Chr" := chrom]
	if(file == grep(pattern = "PSC", dir(), value = TRUE)[1]){
		out <- temp_dat
	}	else 	{
		out <- rbind(out, temp_dat)
	}
}
genome <- "Peichel"
fwrite(file = paste0("All_", genome, "_SNP_Count.csv"), out)

Sum_Ind <- function(Fish_ID){
	temp_ID <- subset(temp_dat, ID == Fish_ID)
	output <- data.table(ID = Fish_ID,
						Total_SNPs = sum(temp_ID$nNonRefHom) + sum(temp_ID$nHets),
						Origin_Ref = ifelse(grepl(pattern = "Gynogene", genome), "Europe", "NorthAmerica"))
	return(output)
}

final_out <- lapply(FUN = Sum_Ind, unique(out$ID)) %>% rbindlist
fwrite(file = "../All_Peichel_Summary_SNPs.csv", final_out)
