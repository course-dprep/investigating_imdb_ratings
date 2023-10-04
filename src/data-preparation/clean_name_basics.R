#Setup
# Loading packages
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)
# Load the data
name_basics <- read_tsv("../../data/name_basics.tsv")

# Filtering for actor/actress only
name_basics <- name_basics %>% mutate(primaryProfession = str_extract(primaryProfession, "actor|actress"))

# Remove NA's
name_basics <- na.omit(name_basics)

# Delete the birthYear and deathYear column
name_basics$deathYear <- NULL
name_basics$birthYear <- NULL

# Seperate the knownForTitles column
name_basics <- name_basics %>%
  separate_rows(knownForTitles, sep = ",")

# Save the cleaned dataset
write_tsv(name_basics, file = "../../gen/data-preparation/temp/name_basics_cleaned.tsv")

