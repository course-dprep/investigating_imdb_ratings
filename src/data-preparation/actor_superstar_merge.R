#Loading libraries
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)

#loading the files
name_basics <- read_tsv("../../data/datasets/name_basics.tsv")
starPower <- read_csv("../../data/datasets/superstar_persons.csv")


##Cleaning name_basics

#filter for actors
name_basics <- name_basics %>% mutate(primaryProfession = str_extract(primaryProfession, "actor|actress"))

# Remove NA's
name_basics <- na.omit(name_basics)

# Delete the birthYear and deathYear column
name_basics$deathYear <- NULL
name_basics$birthYear <- NULL

# Seperate the knownForTitles column
name_basics <- name_basics %>%
  separate_rows(knownForTitles, sep = ",")


##Cleaning superstar_persons

#Filtering for actors
starPowerClean <- starPower %>%
  filter(category == 'actor')

#Filtering for dublicates
starPowerClean <- starPowerClean %>%
  distinct(primaryName, Rank, earnings, .keep_all = TRUE)

#Create new superstar variable
starPowerClean <- starPowerClean %>%
  mutate(superstar = ifelse(Rank <= 100, 1, 0))


##Merging the datasets

# Create a subset of the first 200 rows of name_basics
name_basics_subset <- head(name_basics, 200)

# Merging the datasets
name_basics_superstar_subset <- name_basics_subset %>%
  left_join(starPowerClean, by = c("nconst"), suffix = c("_imdb", "_ss"))

#Merging the datasets via a left join -> Having more data
name_basics_superstar <- name_basics %>%
  left_join(starPowerClean, by = c("nconst"), suffix = c("_imdb", "_ss"))

#Merging the datasets via a right_join -> having clean data (Floris and I prefere this one to use as this gives us a usable and workable startingpoint)
name_basics_superstar_right <- name_basics %>%
  right_join(
    starPowerClean %>% 
      select(-primaryName, -primaryProfession),
    by = c("nconst"))












