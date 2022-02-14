grep -o "^chr[a-Z]*[[:space:]][0-9]*[[:space:]].[[:space:]][A-Z]" All_Autosome_Random_10k_Peichel_SNPs_Filtered_Selected.vcf | sed -e "s/^chr[a-Z]*[[:space:]][0-9]*[[:space:]].[[:space:]]//" > All_Peichel_Random_10k_SNPs_Reference.txt

grep -o "^Gy_chr[a-Z]*[[:space:]][0-9]*[[:space:]].[[:space:]][A-Z]" All_Autosome_Random_10k_Gynogene_SNPs_Filtered_Selected.vcf | sed -e "s/^Gy_chr[a-Z]*[[:space:]][0-9]*[[:space:]].[[:space:]]//" > All_Gynogene_Random_10k_SNPs_Reference.txt

tr -d '\n' <  All_Gynogene_Random_10k_SNPs_Reference.txt
tr -d '\n' <  All_Peichel_Random_10k_SNPs_Reference.txt