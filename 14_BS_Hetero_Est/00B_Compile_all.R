suppressMessages(library(data.table))
suppressMessages(library(dplyr))
suppressMessages(library(stringr))

## A function to get a summary from each RData list.
get_sums <- function(input_table){
  output <- data.table(Chr = unique(input_table$CHR),
                        Population = unique(input_table$POP),
                        Hom_Ref = sum(input_table$HomRef),
                        HomNonRef = sum(input_table$HomNonRef),
                        HetRefNon = sum(input_table$HetRefNon),
                        HetNonNon = sum(input_table$HetNonNon),
                        Missing = sum(input_table$Missing))
  return(output)
}

for(i in grep("*.RData", dir(), value = T)){
  pop <- str_extract(pattern = "[CGNU][A12OS]_[LR]", i)
  cat(paste0(pop, ":", i, "\n"))
  load(i)
  if(i == grep("*.RData", dir(), value = T)[1]){
		final_out <- lapply(FUN = get_sums, temp_list) %>% rbindlist
	} else {
		temp_out <- lapply(FUN = get_sums, temp_list) %>% rbindlist
		final_out <- rbind(final_out, temp_out)
	}
  rm(temp_list)
}
fwrite(file = "All_genome_zygosity_gynogene.csv", final_out)