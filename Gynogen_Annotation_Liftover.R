## Updating the coordinates in the unmapped region of the reference genome
## Date: 17/01/23

library(data.table)
library(dplyr)

contigs <- fread("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/04_Synteny/01_Chromosembl/Contigs_to_unmap2.csv", header = F)
#contigs <- fread("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/04_Synteny/01_Chromosembl/Contigs_to_unmap.csv", header = F)
cont_lens <- fread("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/ENA_Upload/Updated/Gynogene_pchrom_updated.fasta.fai")[,c(1:2)]
#cont_lens <- fread("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/04_Synteny/01_Chromosembl/Gynogen_PacBio_reference.fasta.fai")[,c(1:2)]

to_remap <- merge(contigs, cont_lens, by = "V1")
sum(to_remap$V2)
#fwrite(to_remap, file = "D:/QM_PhD/QM_PhD/Chapter_4_CompGen/ENA_Upload/Updated/Gynogene_chrUn_remapping_coords.csv")

cont_coords <- fread("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/ENA_Upload/Updated/Gynogene_chrUn_remapping_coords2.csv") 
gtf <- rtracklayer::readGFF("D:/QM_PhD/QM_PhD/Chapter_4_CompGen/12_Annotation/Gy_allnoM_rd3.maker_apocrita.noseq.gff") %>% as.data.table

## Separating unmapped and mapped chrs
uns <- subset(gtf, seqid == "Gy_chrUn")
non <- subset(gtf, seqid != "Gy_chrUn")

###############################################
##   Step 1: Identifying Misannotattions     ##
###############################################

## Checking which rows are kept
for(i in 1:nrow(cont_coords)){
	temp_contig <- cont_coords[i,]
	message(temp_contig$ID)
	temp_annots <- subset(uns, start >= temp_contig$Remap_Start & end <= temp_contig$Remap_End)
	if(i == 1){
		kept_rows <- temp_annots
	} else {
		kept_rows <- rbind(kept_rows, temp_annots)
	}
}

## Simplifying annotations to compare to entire set
uns2 <- uns[,1:10]
kr2 <- kept_rows[,1:10]
uns2[,"NewID" := paste(seqid, source, type, start, end, score, strand, phase, ID, Name, sep = "_")]
kr2[,"NewID" := paste(seqid, source, type, start, end, score, strand, phase, ID, Name, sep = "_")]

rows <- !(uns2$NewID %in% kr2$NewID) 
annotations_spanning_intervals <- uns[rows,]
annotations_spanning_intervals$type %>% table

misplaced_genes <- subset(annotations_spanning_intervals, type == "gene")
misplaced_geneIDs <- misplaced_genes$ID %>% unique

## Removing all the genes that are wrong and any other annotations associated with them
temp_uns <- uns
for(wg in misplaced_geneIDs){
	message(wg)
	temp_annots <- subset(temp_uns, !grepl(pattern = wg, ID)) %>% subset(., !grepl(pattern = wg, Parent)) %>% subset(., !grepl(pattern = wg, Name)) %>% subset(., !grepl(pattern = wg, Alias))
	temp_uns <- temp_annots
} 


###############################################
##         Step 2: Updating the GFF 	     ##
###############################################
## Clucnky as hell, but it works. 
for(i in 1:nrow(cont_coords)){
	temp_contig <- cont_coords[i,]
	message(temp_contig$ID)

	## Isolating the correct annotations
	temp_annots <- subset(temp_uns, start >= temp_contig$Remap_Start & end <= temp_contig$Remap_End)
	temp_annots$seqid <- temp_annots$seqid %>% gsub(., pattern = "Gy_chrUn", replacement = temp_contig$ID)
	temp_annots$ID    <- temp_annots$ID %>% gsub(., pattern = "Gy_chrUn", replacement = temp_contig$ID)
	temp_annots$Parent <- temp_annots$Parent %>% gsub(., pattern = "Gy_chrUn", replacement = temp_contig$ID)
	temp_annots$Name <- temp_annots$Name %>% gsub(., pattern = "Gy_chrUn", replacement = temp_contig$ID)
	temp_annots$Target <- temp_annots$Target %>% gsub(., pattern = "Gy_chrUn", replacement = temp_contig$ID)

	## Adjusting the coordinates
	temp_annots[,"start" := start - temp_contig$Remap_Start]	
	temp_annots[,"end" := end - temp_contig$Remap_Start]	

	## Generating the contig annotation
	temp_cont <- subset(uns, type == "contig")
	temp_cont$seqid <- temp_contig$ID
	temp_cont$ID <- temp_contig$ID
	temp_cont$Name <- temp_contig$ID
	temp_cont$end <- temp_contig$Length

	## Building adjusted output
	temp_output <- rbind(temp_cont, temp_annots)
	if(i == 1){
		new_uns <- temp_output
	} else {
		new_uns <- rbind(new_uns, temp_output)
	}
}

all_annots <- rbind(non, new_uns)
fwrite(all_annots, file = "D:/QM_PhD/QM_PhD/Chapter_4_CompGen/ENA_Upload/Gy_updated_GychrUn_Annots.csv")

###############################################
##         Step 3: Validating Changes 	     ##
###############################################
check_contig <- function(contig_id){
	message(contig_id)
	new_cont <- subset(new_uns, seqid == contig_id & type == "gene")
	if(nrow(new_cont) == 0){
		message(paste0("No genes in ", contig_id))
	} else {
		old_coords <- subset(uns, ID == new_cont$ID[1])
		message(paste0("samtools faidx Gynogene_pchrom_updated.fasta ", contig_id, ":", new_cont$start[1], "-", new_cont$end[1]))
		message(paste0("samtools faidx Gynogen_pchrom_assembly_all.fasta Gy_chrUn:", old_coords$start[1], "-", old_coords$end[1]))
	}
}

for(cont in cont_coords$ID){
	check_contig(cont)
}

###############################################
##         Step 4: Writing the GFF  	     ##
###############################################
## NB this section was parallelised on an HPC
gff_attributes <- function(row_num, df = all_annots){
	## removing empty and NA rows. 
	temp_row <- df[row_num,9:22] %>% select_if(~ !any((is.na(.) | grepl(pattern = "^$", .) | identical(., character(0)))))
	idx <- order(c(seq_along(names(temp_row)), seq_along(temp_row[1,] %>% as.character)))
	unlist(c(paste0(names(temp_row), "=") ,paste0(as.character(temp_row[1,]), ";"))[idx]) %>%  paste(., sep="", collapse="") %>% as.data.table %>% return
}
to_remove <- function(val){
	ifelse((is.na(val) | grepl(pattern = "^$", val) | identical(val, character(0))), TRUE, FALSE)
}

all_annots <- fread("/rds/general/user/dthorbur/home/02_Projects/QM1_GyAnnots/Gy_updated_GychrUn_Annots.csv")

## Fixing the missing "." in the source column for chromosomes.
all_annots$source %>% table
all_annots[,"source" := ifelse(grepl(pattern = "^$", source), ".", source)]

## Fixing the "*" in the strand column for chromosomes.
all_annots$strand %>% table
all_annots[,"strand" := ifelse(grepl(pattern = "^\\*$", strand), ".", strand)]

## Fixing the NAs to "." in the phase column.
all_annots$phase %>% table
all_annots[,"phase" := ifelse(is.na(phase), ".", phase)]

## Fixing the NAs to "." in the phase column.
all_annots[,"Parent" := ifelse(grepl(pattern = "character.0.", Parent), "", Parent)]


coord_mult <- commandArgs(trailingOnly=TRUE) %>% as.numeric
en_coord <- (coord_mult * 1000000) + 1
st_coord <- en_coord - 1000000
if(coord_mult == 10){
	en_coord <- 9161438
}

output <- data.table(
	col1 = all_annots$seqid[st_coord:en_coord],
	col2 = all_annots$source[st_coord:en_coord],
	col3 = all_annots$type[st_coord:en_coord],
	col4 = all_annots$start[st_coord:en_coord],
	col5 = all_annots$end[st_coord:en_coord],
	col6 = all_annots$score[st_coord:en_coord],
	col7 = all_annots$strand[st_coord:en_coord],
	col8 = all_annots$phase[st_coord:en_coord])
## Left for a long time. Didn't finish....


## Trying a loop instead. This is going to be slow.....
#temp_col9 <- NULL
#for(i in 1:nrow(output)){
#	message(i)
#	temp_col9 <- append(temp_col9, gff_attributes(i))
#}
#output[,"col9" := temp_col9]
#output$col9[1:length(temp_col9)] <- temp_col9

## Is this any faster? 
#for(i in length(temp_col9):nrow(output)){
#	message(i)
#	output$col9[i] <- gff_attributes(i)
#}
temp_col9 <- rbindlist(lapply(FUN = gff_attributes, st_coord:en_coord))
output[,"col9" := temp_col9]

fwrite(file = paste0("Gynogen_Remap_Annots_", coord_mult,".tsv"), sep = "\t", output, col.names = FALSE)
## The following segments were put together with cat. 
