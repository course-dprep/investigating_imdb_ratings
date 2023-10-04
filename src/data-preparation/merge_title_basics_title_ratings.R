# SETUP

library(tidyverse)

title_ratings_cleaned <- read_tsv('../../gen/data-preparation/temp/title_ratings_cleaned.tsv')

title_basics_cleaned <- read_tsv('../../gen/data-preparation/temp/title_basics_cleaned.tsv')

# Data Preparation

title_basics_ratings <- title_ratings_cleaned %>% left_join(title_basics_cleaned, by = 'tconst') %>% drop_na()

# Save The Cleaned Dataset

write_tsv(title_basics_ratings, '../../gen/data-preparation/input/title_basics_ratings_merged.tsv')
