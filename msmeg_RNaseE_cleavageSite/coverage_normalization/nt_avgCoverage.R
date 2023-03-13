
############## filter CDS by nt average coverage
library(tidyverse)

####### load nt average coverage
nt_average <- read.table('./coverage_avgPerNt.txt', row.names = 1)
# summary(nt_average)

nt_average_filtered <- nt_average %>% 
  filter_all(all_vars(. > 5))

write.table(nt_average_filtered, "./coverage_avgPerNtFiltered.txt", 
            quote = FALSE, sep = "\t", col.names = FALSE)
