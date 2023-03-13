
library(tidyverse)

######## get nt coverage ratios
####### Known cleavage sites from Carla
###### high confidence
cleave_plus_known_highConfi <- read.table("CleavageSite_highConfi_plus.txt")
colnames(cleave_plus_known_highConfi) <- c("nt_pos", "strand")
cleave_minus_known_highConfi <- read.table("CleavageSite_highConfi_minus.txt")
colnames(cleave_minus_known_highConfi) <- c("nt_pos", "strand")

###### medium confidence
cleave_plus_known_medConfi <- read.table("CleavageSite_medConfi_plus.txt")
colnames(cleave_plus_known_medConfi) <- c("nt_pos")
cleave_minus_known_medConfi <- read.table("CleavageSite_medConfi_minus.txt")
colnames(cleave_minus_known_medConfi) <- c("nt_pos")

###### global nt positions
##### conAtc to connoAtc
cleave_plus_ratio_cds_conAtc2connoAtc <- read.table("coverage_plus_NtCDSNormFilteredUnique_conAtc_to_connoAtc_Ratio.txt", col.names = c("nt_pos", "gene", "log2_ratio"))
cleave_minus_ratio_cds_conAtc2connoAtc <- read.table("coverage_minus_NtCDSNormFilteredUnique_conAtc_to_connoAtc_Ratio.txt", col.names = c("nt_pos", "gene", "log2_ratio"))

cleave_plus_ratio_cds_conAtc2connoAtc$compare <- "conAtc2connoAtc"
cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi <- cleave_plus_ratio_cds_conAtc2connoAtc[which(cleave_plus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_plus_known_highConfi$nt_pos), ]
cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi$scope <- "CDS_Known_highConfi"
cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi$compare <- "conAtc2connoAtc"
cleave_minus_ratio_cds_conAtc2connoAtc$compare <- "conAtc2connoAtc"
cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi <- cleave_minus_ratio_cds_conAtc2connoAtc[which(cleave_minus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_minus_known_highConfi$nt_pos), ]
cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi$scope <- "CDS_Known_highConfi"
cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi$compare <- "conAtc2connoAtc"

cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi <- cleave_plus_ratio_cds_conAtc2connoAtc[which(cleave_plus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_plus_known_medConfi$nt_pos), ]
cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi$scope <- "CDS_Known_medConfi"
cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi$compare <- "conAtc2connoAtc"
cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi <- cleave_minus_ratio_cds_conAtc2connoAtc[which(cleave_minus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_minus_known_medConfi$nt_pos), ]
cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi$scope <- "CDS_Known_medConfi"
cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi$compare <- "conAtc2connoAtc"

cleave_plus_ratio_cds_conAtc2connoAtc_known_excl <- cleave_plus_ratio_cds_conAtc2connoAtc[which(!(cleave_plus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_plus_known_highConfi$nt_pos)), ]
cleave_plus_ratio_cds_conAtc2connoAtc_known_excl$scope <- "CDS_Global"
cleave_minus_ratio_cds_conAtc2connoAtc_known_excl <- cleave_minus_ratio_cds_conAtc2connoAtc[which(!(cleave_minus_ratio_cds_conAtc2connoAtc$nt_pos %in% cleave_minus_known_highConfi$nt_pos)), ]
cleave_minus_ratio_cds_conAtc2connoAtc_known_excl$scope <- "CDS_Global"

write.table(cleave_plus_ratio_cds_conAtc2connoAtc_known_excl, "coverage_ratio_plus_conAtc2connoAtc_global.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_conAtc2connoAtc_known_excl, "coverage_ratio_minus_conAtc2connoAtc_global.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi, "coverage_ratio_plus_conAtc2connoAtc_known_highConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi, "coverage_ratio_minus_conAtc2connoAtc_known_highConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi, "coverage_ratio_plus_conAtc2connoAtc_known_medConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi, "coverage_ratio_minus_conAtc2connoAtc_known_medConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")

##### RNaseE KD Atc to no Atc
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc <- read.table("coverage_plus_NtCDSNormFilteredUnique_EKDAtc_to_EKDnoAtc_Ratio.txt", col.names = c("nt_pos", "gene", "log2_ratio"))
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc <- read.table("coverage_minus_NtCDSNormFilteredUnique_EKDAtc_to_EKDnoAtc_Ratio.txt", col.names = c("nt_pos", "gene", "log2_ratio"))

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc$compare <- "EKDAtc2EKDnoAtc"
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- cleave_plus_ratio_cds_EKDAtc2EKDnoAtc[which(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_plus_known_highConfi$nt_pos), ]
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi$scope <- "CDS_Known_highConfi"
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi$compare <- "EKDAtc2EKDnoAtc"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc$compare <- "EKDAtc2EKDnoAtc"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- cleave_minus_ratio_cds_EKDAtc2EKDnoAtc[which(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_minus_known_highConfi$nt_pos), ]
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi$scope <- "CDS_Known_highConfi"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi$compare <- "EKDAtc2EKDnoAtc"

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- cleave_plus_ratio_cds_EKDAtc2EKDnoAtc[which(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_plus_known_medConfi$nt_pos), ]
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi$scope <- "CDS_Known_medConfi"
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi$compare <- "EKDAtc2EKDnoAtc"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- cleave_minus_ratio_cds_EKDAtc2EKDnoAtc[which(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_minus_known_medConfi$nt_pos), ]
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi$scope <- "CDS_Known_medConfi"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi$compare <- "EKDAtc2EKDnoAtc"

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_excl <- cleave_plus_ratio_cds_EKDAtc2EKDnoAtc[which(!(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_plus_known_highConfi$nt_pos)), ]
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_excl$scope <- "CDS_Global"
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_excl <- cleave_minus_ratio_cds_EKDAtc2EKDnoAtc[which(!(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc$nt_pos %in% cleave_minus_known_highConfi$nt_pos)), ]
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_excl$scope <- "CDS_Global"

write.table(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_excl, "coverage_ratio_plus_EKDAtc2EKDnoAtc_global.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_excl, "coverage_ratio_minus_EKDAtc2EKDnoAtc_global.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, "coverage_ratio_plus_EKDAtc2EKDnoAtc_known_highConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, "coverage_ratio_minus_EKDAtc2EKDnoAtc_known_highConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, "coverage_ratio_plus_EKDAtc2EKDnoAtc_known_medConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, "coverage_ratio_minus_EKDAtc2EKDnoAtc_known_medConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")

