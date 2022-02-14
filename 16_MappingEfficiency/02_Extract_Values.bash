
echo "ID,Ref_Org,Total_Reads,Mapped_Reads,Duplicates,Pairs_Mapped,Singletons" > Mapping_Efficiency_Both_060720.csv
for Genome in Peichel Gynogene
do
  for i in ./"$Genome"/*
  do
  	ID=`basename $i | sed -e "s/.$Genome//"`
	if [ $Genome == "Peichel" ]
	then
		Ref_Org=NorthAmerica
	elif [ $Genome == "Gynogene" ]
	then
		Ref_Org=Europe
	fi
	Tot=`grep "Total reads" $i | sed -e "s/Total reads:[ \t]*//"`
	Map=`grep "Mapped reads" $i | grep -Po "[0-9]{5,12}" | head -n 1`
	Dup=`grep "Duplicates" $i | grep -Po "[0-9]{6,12}" | head -n 1`
	Both=`grep "Both pairs mapped" $i | grep -Po "[0-9]{5,12}" | head -n 1`
	Sing=`grep "Singletons" $i | grep -Po "[0-9]{5,12}" | head -n 1`
	
	echo "$ID","$Ref_Org","$Tot","$Map","$Dup","$Both","$Sing" >> Mapping_Efficiency_Both_060720.csv
	echo $ID
  done
done


module loar R/3.5.3
R

library(data.table)

data <- fread("Mapping_Efficiency_Both_060720.csv")
Pop_list <- data.table(Population = c(rep("G1_R", 6), rep("G1_L", 6), rep("G2_R", 6), rep("G2_L", 6),
									  rep("US_R", 6), rep("US_L", 6), rep("CA_R", 6), rep("CA_L", 6),
									  rep("NO_R", 6), rep("NO_L", 6)),
						ID = c(paste0("BS",seq(1,11,2)), paste0("BS",seq(2,12,2)), paste0("BS",seq(13,23,2)), paste0("BS",seq(14,24,2)),
								paste0("BS",seq(31,41,2)), paste0("BS",seq(32,42,2)), paste0("BS",seq(43,53,2)), paste0("BS",seq(44,54,2)),
								paste0("BS",seq(55,65,2)), paste0("BS",seq(56,66,2))))
out <- merge(data, Pop_list, by = "ID") 
out[, "Map_Eff" := Mapped_Reads/Total_Reads]
out[, "Pairs_Eff" := Pairs_Mapped/Total_Reads]
out[, "Dup_Eff" := Duplicates/Total_Reads]
out[, "Sing_Eff" := Singletons/Total_Reads]
fwrite(file = "Mapping_Efficiency_wPops_Both_060720.csv", out)                                                                                          