library(data.table)
library(dplyr)

Coverage <- function(chr){
  temp_chr <- subset(data, V1 == chr)
  temp_chr[, "Total_Coverage" := V2*V3]
  output <- data.table(Chr = chr, Coverage = sum(temp_chr$Total_Coverage)/unique(temp_chr$V4))
  return(output)
} 

for(Genome in c("Peichel", "Gynogene")){
  cat(paste("Starting on ", Genome, ": ", date(), "\n"))
  for(ID in paste0("BS", seq(1,66,1))){
    cat(paste("Working on", ID, " from ", Genome, "\n"))
    data <- fread(paste0("/data/SBCS-EizaguirreLab/Miles/CompGenomics_Collab/02_Coverage_Analysis/", Genome, "/raw/", ID, ".genomecov_summary_", tolower(Genome)))
    temp_ID <- lapply(FUN = Coverage, unique(data$V1)) %>% rbindlist
    temp_ID[, "Origin_Ref" := ifelse(grepl("Gynogene", Genome), "Europe", "NorthAmerica")]
    temp_ID[, "ID" := ID]
    if(Genome == "Peichel" & ID == "BS1"){
      final_out <- temp_ID
    } else {
      final_out <- rbind(final_out, temp_ID)
    }
  }
}
fwrite(file = "All_Genome_Coverages.csv", final_out)
