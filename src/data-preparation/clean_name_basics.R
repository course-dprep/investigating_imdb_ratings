#Setup
# Loading packages
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)
# Load the data
name.basics <- read_tsv("../../data/datasets/name_basics.tsv")

# Filtering for actor/actress only
name.basics <- name.basics %>% mutate(primaryProfession = str_extract(primaryProfession, "actor|actress"))

# Remove NA's
name.basics <- na.omit(name.basics)

# Delete the birthYear and deathYear column
name.basics$deathYear <- NULL
name.basics$birthYear <- NULL

# Seperate the knownForTitles column
name.basics <- name.basics %>%
  separate_rows(knownForTitles, sep = ",")

# Save the cleaned dataset
write_tsv(name.basics, file = "../../data/datasets/name_basics_cleaned.tsv")

