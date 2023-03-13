
library(tidyverse)

####### split nts by ratio value
###### conAtc to connoAtc
cleave_plus_ratio_cds_conAtc2connoAtc_global <- read.table("coverage_ratio_plus_conAtc2connoAtc_global.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "plus")
cleave_minus_ratio_cds_conAtc2connoAtc_global <- read.table("coverage_ratio_minus_conAtc2connoAtc_global.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "minus")
cleave_ratio_cds_conAtc2connoAtc_global <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_global, cleave_minus_ratio_cds_conAtc2connoAtc_global) %>% 
  arrange(nt_pos_conAtc2connoAtc)

cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi <- read.table("coverage_ratio_plus_conAtc2connoAtc_known_highConfi.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "plus")
cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi <- read.table("coverage_ratio_minus_conAtc2connoAtc_known_highConfi.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "minus")
cleave_ratio_cds_conAtc2connoAtc_known_highConfi <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi, cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi) %>%
  arrange(nt_pos_conAtc2connoAtc)

cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi <- read.table("coverage_ratio_plus_conAtc2connoAtc_known_medConfi.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "plus")
cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi <- read.table("coverage_ratio_minus_conAtc2connoAtc_known_medConfi.txt", header = TRUE) %>% 
  rename(gene_conAtc2connoAtc = gene, log2_ratio_conAtc2connoAtc = log2_ratio, nt_pos_conAtc2connoAtc = nt_pos, compare_conAtc2connoAtc = compare, scope_conAtc2connoAtc = scope) %>% 
  mutate(strand_conAtc2connoAtc = "minus")
cleave_ratio_cds_conAtc2connoAtc_known_medConfi <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi, cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi) %>%
  arrange(nt_pos_conAtc2connoAtc)

###### RNaseE KD Atc to no Atc
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_global <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_global.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "plus")
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_global <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_global.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "minus")
cleave_ratio_cds_EKDAtc2EKDnoAtc_global <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_global, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_global) %>%
  arrange(nt_pos_EKDAtc2EKDnoAtc)

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_known_highConfi.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "plus")
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_known_highConfi.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "minus")
cleave_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi) %>%
  arrange(nt_pos_EKDAtc2EKDnoAtc)

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_known_medConfi.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "plus")
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_known_medConfi.txt", header = TRUE) %>% 
  rename(gene_EKDAtc2EKDnoAtc = gene, log2_ratio_EKDAtc2EKDnoAtc = log2_ratio, nt_pos_EKDAtc2EKDnoAtc = nt_pos, compare_EKDAtc2EKDnoAtc = compare, scope_EKDAtc2EKDnoAtc = scope) %>% 
  mutate(strand_EKDAtc2EKDnoAtc = "minus")
cleave_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi) %>%
  arrange(nt_pos_EKDAtc2EKDnoAtc)

####### combine ratio comparisons and strand
cleave_ratio_global <- bind_cols(cleave_ratio_cds_EKDAtc2EKDnoAtc_global, cleave_ratio_cds_conAtc2connoAtc_global) %>% 
  select(nt_pos_EKDAtc2EKDnoAtc, gene_EKDAtc2EKDnoAtc, strand_EKDAtc2EKDnoAtc, log2_ratio_EKDAtc2EKDnoAtc, log2_ratio_conAtc2connoAtc) %>% 
  rename(nt_pos = nt_pos_EKDAtc2EKDnoAtc, gene = gene_EKDAtc2EKDnoAtc, strand = strand_EKDAtc2EKDnoAtc)

cleave_ratio_known_highConfi <- bind_cols(cleave_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, cleave_ratio_cds_conAtc2connoAtc_known_highConfi) %>% 
  select(nt_pos_EKDAtc2EKDnoAtc, gene_EKDAtc2EKDnoAtc, strand_EKDAtc2EKDnoAtc, log2_ratio_EKDAtc2EKDnoAtc, log2_ratio_conAtc2connoAtc) %>% 
  rename(nt_pos = nt_pos_EKDAtc2EKDnoAtc, gene = gene_EKDAtc2EKDnoAtc, strand = strand_EKDAtc2EKDnoAtc)

cleave_ratio_known_medConfi <- bind_cols(cleave_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, cleave_ratio_cds_conAtc2connoAtc_known_medConfi) %>% 
  select(nt_pos_EKDAtc2EKDnoAtc, gene_EKDAtc2EKDnoAtc, strand_EKDAtc2EKDnoAtc, log2_ratio_EKDAtc2EKDnoAtc, log2_ratio_conAtc2connoAtc) %>% 
  rename(nt_pos = nt_pos_EKDAtc2EKDnoAtc, gene = gene_EKDAtc2EKDnoAtc, strand = strand_EKDAtc2EKDnoAtc)

write.table(cleave_ratio_global, "./nt_position/nt_pos_RatioGlobal.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_ratio_known_highConfi, "./nt_position/nt_pos_RatioKnownHighConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_ratio_known_medConfi, "./nt_position/nt_pos_RatioKnownMedConfi.txt", quote = FALSE, row.names = FALSE, sep = "\t")


####### split by conAtc to connoAtc ratio
###### top 5 percent
cleave_ratio_global_top5perct_ctrl <- cleave_ratio_global %>% 
  filter(log2_ratio_conAtc2connoAtc > quantile(log2_ratio_conAtc2connoAtc, 0.95))
summary(cleave_ratio_global_top5perct_ctrl$log2_ratio_conAtc2connoAtc)
summary(cleave_ratio_global_top5perct_ctrl$log2_ratio_EKDAtc2EKDnoAtc)

###### middle 5 percent
cleave_ratio_global_mid5perct_ctrl_p1 <- cleave_ratio_global %>% 
  filter(log2_ratio_conAtc2connoAtc < quantile(log2_ratio_conAtc2connoAtc, 0.525))
cleave_ratio_global_mid5perct_ctrl_p2 <- cleave_ratio_global %>% 
  filter(log2_ratio_conAtc2connoAtc > quantile(log2_ratio_conAtc2connoAtc, 0.475)) %>% 
  select(nt_pos)
cleave_ratio_global_mid5perct_ctrl <- cleave_ratio_global_mid5perct_ctrl_p1 %>% 
  inner_join(cleave_ratio_global_mid5perct_ctrl_p2, by = "nt_pos")
summary(cleave_ratio_global_mid5perct_ctrl$log2_ratio_conAtc2connoAtc)
summary(cleave_ratio_global_mid5perct_ctrl$log2_ratio_EKDAtc2EKDnoAtc)

write.table(cleave_ratio_global_top5perct_ctrl, "./nt_position/nt_pos_RatioGlobalTop5pControlWt.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_ratio_global_mid5perct_ctrl, "./nt_position/nt_pos_RatioGlobalMid5pControlWt.txt", quote = FALSE, row.names = FALSE, sep = "\t")


####### split by RNaseE KD Atc to no Atc ratio
###### top 5 percent
cleave_ratio_global_top5perct_RNaseEKD <- cleave_ratio_global %>% 
  filter(log2_ratio_EKDAtc2EKDnoAtc > quantile(log2_ratio_EKDAtc2EKDnoAtc, 0.95))
summary(cleave_ratio_global_top5perct_RNaseEKD$log2_ratio_EKDAtc2EKDnoAtc)
summary(cleave_ratio_global_top5perct_RNaseEKD$log2_ratio_conAtc2connoAtc)

###### middle 5 percent
cleave_ratio_global_mid5perct_RNaseEKD_p1 <- cleave_ratio_global %>% 
  filter(log2_ratio_EKDAtc2EKDnoAtc < quantile(log2_ratio_EKDAtc2EKDnoAtc, 0.525))
cleave_ratio_global_mid5perct_RNaseEKD_p2 <- cleave_ratio_global %>% 
  filter(log2_ratio_EKDAtc2EKDnoAtc > quantile(log2_ratio_EKDAtc2EKDnoAtc, 0.475)) %>% 
  select(nt_pos)
cleave_ratio_global_mid5perct_RNaseEKD <- cleave_ratio_global_mid5perct_RNaseEKD_p1 %>% 
  inner_join(cleave_ratio_global_mid5perct_RNaseEKD_p2, by = "nt_pos")

summary(cleave_ratio_global_mid5perct_RNaseEKD$log2_ratio_EKDAtc2EKDnoAtc)
summary(cleave_ratio_global_mid5perct_RNaseEKD$log2_ratio_conAtc2connoAtc)

write.table(cleave_ratio_global_top5perct_RNaseEKD, "./nt_position/nt_pos_RatioGlobalTop5pRNaseEKD.txt", quote = FALSE, row.names = FALSE, sep = "\t")
write.table(cleave_ratio_global_mid5perct_RNaseEKD, "./nt_position/nt_pos_RatioGlobalMid5pRNaseEKD.txt", quote = FALSE, row.names = FALSE, sep = "\t")

