#Setup
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)
#Read datasets
starPower_cleaned <- read_csv("../../data/datasets/starPower_cleaned.csv")
name_basics_cleaned <- read_tsv("../../data/datasets/name_basics_cleaned.tsv")

#Merging
#Merging the datasets via a right_join -> having clean data; this gives us a usable and workable starting point
name_basics_starpower_right <- name_basics_cleaned %>%
  right_join(
    starPower_cleaned %>% 
      select(-primaryName, -primaryProfession),
    by = c("nconst"))

#Save merged dataset
write_tsv(name_basics_starpower_right, "../../data/datasets/name_basics_starPower_merged.tsv")


##

#Below, some code for testing
# Create a subset of the first 200 rows of name_basics --> testing code
#name_basics_subset <- head(name_basics_cleaned, 200)
# Merging the datasets
#name_basics_superstar_subset <- name_basics_subset %>%
#left_join(starPower_cleaned, by = c("nconst"), suffix = c("_imdb", "_ss"))

#Merging the datasets via a left join -> Having more data
#name_basics_starpower <- name_basics_cleaned %>%
#left_join(starPower_cleaned, by = c("nconst"), suffix = c("_imdb", "_ss"))