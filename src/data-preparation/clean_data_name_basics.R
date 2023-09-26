# Loading packages
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)

# Load the data
setwd("../../data/name_basics")
title_name_basics <- read_tsv("name.basics.tsv.gz")

# Filtering for actor/actress only
title_name_basics <- title_name_basics %>% mutate(primaryProfession = str_extract(primaryProfession, "actor|actress"))

# Remove NA's
title_name_basics <- na.omit(title_name_basics)

# Delete the birthYear and deathYear column
title_name_basics$deathYear <- NULL
title_name_basics$birthYear <- NULL

# Seperate the knownForTitles column
title_name_basics <- title_name_basics %>%
  separate_rows(knownForTitles, sep = ",")

# Save the cleaned dataset
write.csv(title_name_basics, file = "title_name_basics_cleaned.csv", row.names = TRUE)

