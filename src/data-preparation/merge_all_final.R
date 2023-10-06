# Setup

library(tidyverse)

name_basics_starPower_merged <- read_tsv('../../gen/data-preparation/temp/name_basics_starPower_merged_cleaned.tsv')

title_basics_ratings_genre_merged <- read_tsv('../../gen/data-preparation/input/title_basics_ratings_genre_merged.tsv')

# Merging

final_merged_dataset <- title_basics_ratings_genre_merged %>% left_join(name_basics_starPower_merged, 
                                                                  by = c('tconst' = 'knownForTitles'))

write_tsv(final_merged_dataset, '../../gen/data-preparation/output/final_merged_dataset.tsv')