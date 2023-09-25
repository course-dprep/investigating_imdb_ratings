# Load title_name_basics 
library(tidyverse)
setwd("C:/Users/Flori/Documents/dPrep/team-project-team_8/data/name_basics")

# Load 200 rows for exploratory coding
title_name_basics <- read_tsv("name.basics.tsv.gz")

# Filtering for actor/actress only
library(dplyr)
library(stringr)
library(tidyr)
title_name_basics <- title_name_basics %>% mutate(primaryProfession = str_extract(primaryProfession, "actor|actress"))

# Remove NA's
title_name_basics <- na.omit(title_name_basics)

# Delete the birthYear and deathYear column
title_name_basics$deathYear <- NULL
title_name_basics$birthYear <- NULL

# Seperate the knownForTitles column
title_name_basics <- title_name_basics %>%
  separate_rows(knownForTitles, sep = ",")

