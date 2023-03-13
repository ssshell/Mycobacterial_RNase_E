
library(tidyverse)
library(PupillometryR)
library(RColorBrewer)
set.seed(7)

####### get color scheme for coverage ratio comparison
paired_nt_compare <- c("#1F78B4", "#FF7F00")


####### global nt coverage ratios
###### control wt ratio
cleave_plus_ratio_cds_conAtc2connoAtc_global <- read.table("coverage_ratio_plus_conAtc2connoAtc_global.txt", header = TRUE)
cleave_minus_ratio_cds_conAtc2connoAtc_global <- read.table("coverage_ratio_minus_conAtc2connoAtc_global.txt", header = TRUE)
cleave_ratio_cds_conAtc2connoAtc_global <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_global, cleave_minus_ratio_cds_conAtc2connoAtc_global)

###### RNaseE KD ratio
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_global <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_global.txt", header = TRUE)
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_global <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_global.txt", header = TRUE)
cleave_ratio_cds_EKDAtc2EKDnoAtc_global <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_global, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_global)

###### combined comparisons
cleave_ratio_global <- bind_rows(cleave_ratio_cds_EKDAtc2EKDnoAtc_global, cleave_ratio_cds_conAtc2connoAtc_global) %>% 
  mutate(compare = factor(compare))

####### known cleavage sites
###### control wt ratio
cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi <- read.table("coverage_ratio_plus_conAtc2connoAtc_known_highConfi.txt", header = TRUE)
cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi <- read.table("coverage_ratio_minus_conAtc2connoAtc_known_highConfi.txt", header = TRUE)
cleave_ratio_cds_conAtc2connoAtc_known_highConfi <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_known_highConfi, cleave_minus_ratio_cds_conAtc2connoAtc_known_highConfi)

cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi <- read.table("coverage_ratio_plus_conAtc2connoAtc_known_medConfi.txt", header = TRUE)
cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi <- read.table("coverage_ratio_minus_conAtc2connoAtc_known_medConfi.txt", header = TRUE)
cleave_ratio_cds_conAtc2connoAtc_known_medConfi <- bind_rows(cleave_plus_ratio_cds_conAtc2connoAtc_known_medConfi, cleave_minus_ratio_cds_conAtc2connoAtc_known_medConfi)

###### RNaseE KD ratio
cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_known_highConfi.txt", header = TRUE)
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_known_highConfi.txt", header = TRUE)
cleave_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi)

cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- read.table("coverage_ratio_plus_EKDAtc2EKDnoAtc_known_medConfi.txt", header = TRUE)
cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- read.table("coverage_ratio_minus_EKDAtc2EKDnoAtc_known_medConfi.txt", header = TRUE)
cleave_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi <- bind_rows(cleave_plus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, cleave_minus_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi)

###### combined comparisons
cleave_ratio_known_highConfi <- bind_rows(cleave_ratio_cds_EKDAtc2EKDnoAtc_known_highConfi, cleave_ratio_cds_conAtc2connoAtc_known_highConfi) %>% 
  mutate(compare = factor(compare))

cleave_ratio_known_medConfi <- bind_rows(cleave_ratio_cds_EKDAtc2EKDnoAtc_known_medConfi, cleave_ratio_cds_conAtc2connoAtc_known_medConfi) %>% 
  mutate(compare = factor(compare))

###### nt ratio density plot
##### RNaseE KD and Control comparisons together
#### to compare global sites without known sites vs. know sites
cleave_ratio_global %>%
  ggplot(aes(colour = compare)) +
  scale_color_manual(values = paired_nt_compare) +
  scale_fill_manual(values = paired_nt_compare) +
  stat_summary(
    mapping = aes(compare, log2_ratio),
    fun.min = function(z) { quantile(z, 0.25) },
    fun.max = function(z) { quantile(z, 0.75) },
    fun = median, size = 2) +
  geom_flat_violin(data = cleave_ratio_global, aes(compare, log2_ratio, fill = compare),
                   alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
  theme_bw() +
  theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text = element_text(size = 45),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title = element_blank(),
        legend.position = "None",
  ) +
  ylim(-2, 2) +
  coord_flip() +
  scale_x_discrete(limits = rev)
ggsave("../results_figures/msmeg_bothCondition_globalExclKnown_densityDistribution.png", width = 25, height = 12, units = "cm", dpi = 600)

#### known high confidence cleavage sites
cleave_ratio_known_highConfi %>% 
  ggplot(aes(colour = compare)) +
  scale_color_manual(values = paired_nt_compare) +
  scale_fill_manual(values = paired_nt_compare) +
  stat_summary(
    mapping = aes(compare, log2_ratio),
    fun.min = function(z) { quantile(z, 0.25) },
    fun.max = function(z) { quantile(z, 0.75) },
    fun = median, size = 2) +
  geom_flat_violin(data = cleave_ratio_known_highConfi, aes(compare, log2_ratio, fill = compare),
                   alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
  theme_bw() +
  theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text = element_text(size = 40),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title = element_blank(),
        legend.position = "None",
  ) +
  ylim(-2, 2) +
  coord_flip() +
  scale_x_discrete(limits = rev)
ggsave("../results_figures/msmeg_bothCondition_highConfi_densityDistribution.png", width = 25, height = 12, units = "cm", dpi = 600)

#### known medium confidence cleavage sites
cleave_ratio_known_medConfi %>% 
  ggplot(aes(colour = compare)) +
  scale_color_manual(values = paired_nt_compare) +
  scale_fill_manual(values = paired_nt_compare) +
  stat_summary(
    mapping = aes(compare, log2_ratio),
    fun.min = function(z) { quantile(z, 0.25) },
    fun.max = function(z) { quantile(z, 0.75) },
    fun = median, size = 2) +
  geom_flat_violin(data = cleave_ratio_known_highConfi, aes(compare, log2_ratio, fill = compare),
                   alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
  theme_bw() +
  theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text = element_text(size = 40),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title = element_blank(),
        legend.position = "None",
  ) +
  ylim(-2, 2) +
  coord_flip() +
  scale_x_discrete(limits = rev)
ggsave("../results_figures/msmeg_bothCondition_medConfi_densityDistribution.png", width = 25, height = 12, units = "cm", dpi = 600)

##### Control ratio only
#### global sites without known sites
cleave_ratio_cds_conAtc2connoAtc_global %>%
  ggplot(aes(colour = compare)) +
  scale_color_manual(values = "#1F78B4") +
  scale_fill_manual(values = "#1F78B4") +
  stat_summary(
    mapping = aes(compare, log2_ratio),
    fun.min = function(z) { quantile(z, 0.25) },
    fun.max = function(z) { quantile(z, 0.75) },
    fun = median, size = 2) +
  geom_flat_violin(data = cleave_ratio_cds_conAtc2connoAtc_global, aes(compare, log2_ratio, fill = compare),
                   alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
  geom_hline(yintercept = 0.4485, linetype = "dashed") +
  geom_hline(yintercept = -0.007335, linetype = "dashed") +
  geom_hline(yintercept = 0.011381, linetype = "dashed") +
  theme_bw() +
  theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text = element_text(size = 40),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title = element_blank(),
        legend.position = "None",
  ) +
  ylim(-2, 2) +
  coord_flip() +
  scale_x_discrete(limits = rev)
ggsave("../results_figures/msmeg_controlAtcvsNoAtc_globalExclKnown_densityDistribution.png", width = 25, height = 7, units = "cm", dpi = 600)

##### RNaseE KD ratio only
cleave_ratio_cds_EKDAtc2EKDnoAtc_global %>%
  ggplot(aes(colour = compare)) +
  scale_color_manual(values = "#FF7F00") +
  scale_fill_manual(values = "#FF7F00") +
  stat_summary(
    mapping = aes(compare, log2_ratio),
    fun.min = function(z) { quantile(z, 0.25) },
    fun.max = function(z) { quantile(z, 0.75) },
    fun = median, size = 2) +
  geom_flat_violin(data = cleave_ratio_cds_EKDAtc2EKDnoAtc_global, aes(compare, log2_ratio, fill = compare),
                   alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
  geom_hline(yintercept = 0.5967, linetype = "dashed") +
  geom_hline(yintercept = -0.018494, linetype = "dashed") +
  geom_hline(yintercept = 0.014854, linetype = "dashed") +
  theme_bw() +
  theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text = element_text(size = 40),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(), 
        axis.title = element_blank(),
        legend.position = "None",
  ) +
  ylim(-2, 2) +
  coord_flip() +
  scale_x_discrete(limits = rev)
ggsave("../results_figures/msmeg_RNaseEKDvsNoAtc_globalExclKnown_densityDistribution.png", width = 25, height = 7, units = "cm", dpi = 600)


# ####### local groups nt coverage ratios
# ###### by control wt to control no target ratio
# ##### top 5% nt ratio
# cleave_ratio_global_top5perct_ControlWt_p1 <- read.table("./nt_position/nt_pos_RatioGlobalTop5pControlWt.txt", header = TRUE)
# cleave_ratio_global_top5perct_ControlWt <- cleave_ratio_global_top5perct_ControlWt_p1 %>% 
#   gather(compare, log2_ratio, -nt_pos, -gene, -strand) %>% 
#   mutate(compare = factor(compare))
# 
# ##### top 5% nt ratio density plot
# cleave_ratio_global_top5perct_ControlWt %>%
#   ggplot(aes(colour = compare)) +
#   scale_color_manual(values = paired_nt_compare) +
#   scale_fill_manual(values = paired_nt_compare) +
#   stat_summary(
#     mapping = aes(compare, log2_ratio),
#     fun.min = function(z) { quantile(z, 0.25) },
#     fun.max = function(z) { quantile(z, 0.75) },
#     fun = median, size = 2) +
#   geom_flat_violin(data = cleave_ratio_global_top5perct_ControlWt, aes(compare, log2_ratio, fill = compare),
#                    alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
#   theme_bw() +
#   theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(), 
#         axis.text = element_text(size = 45),
#         axis.text.y = element_blank(),
#         axis.ticks = element_blank(), 
#         axis.title = element_blank(),
#         legend.position = "None",
#   ) +
#   ylim(-2, 2) +
#   coord_flip() +
#   scale_x_discrete(limits = rev)
#   
# ##### mid 5% nt ratio
# cleave_ratio_global_mid5perct_ControlWt_p1 <- read.table("./nt_position/nt_pos_RatioGlobalMid5pControlWt.txt", header = TRUE)
# cleave_ratio_global_mid5perct_ControlWt <- cleave_ratio_global_mid5perct_ControlWt_p1 %>% 
#   gather(compare, log2_ratio, -nt_pos, -gene, -strand) %>% 
#   mutate(compare = factor(compare))
# 
# ##### mid 5% nt ratio density plot
# cleave_ratio_global_mid5perct_ControlWt %>%
#   ggplot(aes(colour = compare)) +
#   scale_color_manual(values = paired_nt_compare) +
#   scale_fill_manual(values = paired_nt_compare) +
#   stat_summary(
#     mapping = aes(compare, log2_ratio),
#     fun.min = function(z) { quantile(z, 0.25) },
#     fun.max = function(z) { quantile(z, 0.75) },
#     fun = median, size = 2) +
#   geom_flat_violin(data = cleave_ratio_global_mid5perct_ControlWt, aes(compare, log2_ratio, fill = compare),
#                    alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
#   theme_bw() +
#   theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(), 
#         axis.text = element_text(size = 45),
#         axis.text.y = element_blank(),
#         axis.ticks = element_blank(), 
#         axis.title = element_blank(),
#         legend.position = "None",
#   ) +
#   ylim(-2, 2) +
#   coord_flip() +
#   scale_x_discrete(limits = rev)
# 
# ###### by RNaseE depletion to ControlNoTarget ratio
# ##### top 5% nt ratio
# cleave_ratio_global_top5perct_RNaseEdeplete_p1 <- read.table("./nt_position/nt_pos_RatioGlobalTop5pRNaseEdeplete.txt", header = TRUE)
# cleave_ratio_global_top5perct_RNaseEdeplete <- cleave_ratio_global_top5perct_RNaseEdeplete_p1 %>%
#   gather(compare, log2_ratio, -nt_pos, -gene, -strand) %>% 
#   mutate(compare = factor(compare))
# 
# ##### top 5% nt ratio density plot
# cleave_ratio_global_top5perct_RNaseEdeplete %>%
#   ggplot(aes(colour = compare)) +
#   scale_color_manual(values = paired_nt_compare) +
#   scale_fill_manual(values = paired_nt_compare) +
#   stat_summary(
#     mapping = aes(compare, log2_ratio),
#     fun.min = function(z) { quantile(z, 0.25) },
#     fun.max = function(z) { quantile(z, 0.75) },
#     fun = median, size = 2) +
#   geom_flat_violin(data = cleave_ratio_global_top5perct_RNaseEdeplete, aes(compare, log2_ratio, fill = compare),
#                    alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
#   theme_bw() +
#   theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(), 
#         axis.text = element_text(size = 45),
#         axis.text.y = element_blank(),
#         axis.ticks = element_blank(), 
#         axis.title = element_blank(),
#         legend.position = "None",
#   ) +
#   ylim(-2, 2) +
#   coord_flip() +
#   scale_x_discrete(limits = rev)
# 
# ##### mid 5% nt ratio
# cleave_ratio_global_mid5perct_RNaseEdeplete_p1 <- read.table("./nt_position/nt_pos_RatioGlobalMid5pRNaseEdeplete.txt", header = TRUE)
# cleave_ratio_global_mid5perct_RNaseEdeplete <- cleave_ratio_global_mid5perct_RNaseEdeplete_p1 %>%
#   gather(compare, log2_ratio, -nt_pos, -gene, -strand) %>% 
#   mutate(compare = factor(compare))
# 
# ##### mid 5% nt ratio density plot
# cleave_ratio_global_mid5perct_RNaseEdeplete %>%
#   ggplot(aes(colour = compare)) +
#   scale_color_manual(values = paired_nt_compare) +
#   scale_fill_manual(values = paired_nt_compare) +
#   stat_summary(
#     mapping = aes(compare, log2_ratio),
#     fun.min = function(z) { quantile(z, 0.25) },
#     fun.max = function(z) { quantile(z, 0.75) },
#     fun = median, size = 2) +
#   geom_flat_violin(data = cleave_ratio_global_mid5perct_RNaseEdeplete, aes(compare, log2_ratio, fill = compare),
#                    alpha = 0.5, trim = FALSE, adjust = 2, linetype = "blank") +
#   theme_bw() +
#   theme(panel.grid.major = element_line(colour = "grey90", size = 1.5),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(), 
#         axis.text = element_text(size = 45),
#         axis.text.y = element_blank(),
#         axis.ticks = element_blank(), 
#         axis.title = element_blank(),
#         legend.position = "None",
#   ) +
#   ylim(-2, 2) +
#   coord_flip() +
#   scale_x_discrete(limits = rev)
