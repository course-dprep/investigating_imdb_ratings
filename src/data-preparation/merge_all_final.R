# Setup

library(tidyverse)

name_basics_starPower_merged <- read_tsv('../../data/datasets/name_basics_starPower_merged.tsv')

title_basics_ratings_merged <- read_tsv('../../data/datasets/title_basics_ratings_merged.tsv')

# Merging

final_merged_dataset <- title_basics_ratings_merged %>% left_join(name_basics_starPower_merged, 
                                                                  by = c('tconst' = 'knownForTitles'))

write_tsv(final_merged_dataset, '../../data/datasets/final_merged_dataset.tsv')