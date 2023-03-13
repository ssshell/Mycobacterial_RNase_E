
library(tidyverse)
library(RColorBrewer)

####### global sequence context
seq_context_global <- read.table("nt_pos_RatioGlobal_FreqCount.txt", col.names = c('pos', 'A', 'T', 'C', 'G'))

####### control wt to control no target ratio
seq_context_top5_ControlWt <- read.table("nt_pos_RatioGlobalTop5pControlWt_FreqCount.txt", col.names = c('pos', 'A', 'T', 'C', 'G'))
seq_context_mid5_ControlWt <- read.table("nt_pos_RatioGlobalMid5pControlWt_FreqCount.txt", col.names = c('pos', 'A', 'T', 'C', 'G'))

####### RNaseE depletion to ControlNoTarget ratio
seq_context_top5_RNaseEKD <- read.table("nt_pos_RatioGlobalTop5pRNaseEKD_FreqCount.txt", col.names = c('pos', 'A', 'T', 'C', 'G'))
seq_context_mid5_RNaseEKD <- read.table("nt_pos_RatioGlobalMid5pRNaseEKD_FreqCount.txt", col.names = c('pos', 'A', 'T', 'C', 'G'))

####### get frequency count of sequence context
###### global sequence context
seq_context_global %>%
  gather(nt, nt_freq, -pos) %>% 
  mutate(nt = as.factor(nt)) %>% 
  ggplot(aes(x = pos, y = nt_freq, group = nt)) +
  geom_line(aes(color = nt), size = 2) +
  geom_point(aes(color = nt), size = 4) +
  scale_color_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text.y = element_text(size = 30),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.title = element_blank()) +
  geom_vline(xintercept = 21, linetype = "dashed", color = "black") +
  ylim(0, 0.4)

###### control wt to control no target ratio
##### top 5% ratio
seq_context_top5_ControlWt %>%
  gather(nt, nt_freq, -pos) %>% 
  mutate(nt = as.factor(nt)) %>% 
  ggplot(aes(x = pos, y = nt_freq, group = nt)) +
  geom_line(aes(color = nt), size = 2) +
  geom_point(aes(color = nt), size = 4) +
  scale_color_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text.y = element_text(size = 30),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.title = element_blank()) +
  geom_vline(xintercept = 21, linetype = "dashed", color = "black") +
  ylim(0, 0.4)
ggsave("../results_figures/msmeg_controlAtcvsNoAtcRatio_seqContextTop5pct.png", width = 30, height = 12, units = "cm", dpi = 600)

##### middle 5% ratio
seq_context_mid5_ControlWt %>%
  gather(nt, nt_freq, -pos) %>% 
  mutate(nt = as.factor(nt)) %>% 
  ggplot(aes(x = pos, y = nt_freq, group = nt)) +
  geom_line(aes(color = nt), size = 2) +
  geom_point(aes(color = nt), size = 4) +
  scale_color_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text.y = element_text(size = 30),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.title = element_blank()) +
  geom_vline(xintercept = 21, linetype = "dashed", color = "black") +
  ylim(0, 0.4)
ggsave("../results_figures/msmeg_controlAtcvsNoAtcRatio_seqContextMiddle5pct.png", width = 30, height = 12, units = "cm", dpi = 600)

###### RNaseE depletion to ControlNoTarget ratio
##### top 5% ratio
seq_context_top5_RNaseEKD %>%
  gather(nt, nt_freq, -pos) %>% 
  mutate(nt = as.factor(nt)) %>% 
  ggplot(aes(x = pos, y = nt_freq, group = nt)) +
  geom_line(aes(color = nt), size = 2) +
  geom_point(aes(color = nt), size = 4) +
  scale_color_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text.y = element_text(size = 30),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.title = element_blank()) +
  geom_vline(xintercept = 21, linetype = "dashed", color = "black") +
  ylim(0, 0.4)
ggsave("../results_figures/msmeg_RNaseEKDvsNoAtcRatio_seqContextTop5pct.png", width = 30, height = 12, units = "cm", dpi = 600)

##### middle 5% ratio
seq_context_mid5_RNaseEKD %>%
  gather(nt, nt_freq, -pos) %>% 
  mutate(nt = as.factor(nt)) %>% 
  ggplot(aes(x = pos, y = nt_freq, group = nt)) +
  geom_line(aes(color = nt), size = 2) +
  geom_point(aes(color = nt), size = 4) +
  scale_color_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.text.y = element_text(size = 30),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.title = element_blank()) +
  geom_vline(xintercept = 21, linetype = "dashed", color = "black") +
  ylim(0, 0.4)
ggsave("../results_figures/msmeg_RNaseEKDvsNoAtcRatio_seqContextMiddle5pct.png", width = 30, height = 12, units = "cm", dpi = 600)

