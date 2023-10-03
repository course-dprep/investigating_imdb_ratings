#Setup
#Loading libraries
library(tidyverse)
library(dplyr)
library(stringr)
library(tidyr)
#loading the file
starPower <- read_csv("../../data/datasets/starPower.csv")

#Filtering for actors
starPower <- starPower %>%
  filter(category == 'actor')

#Filtering for dublicates
starPower <- starPower %>%
  distinct(primaryName, Rank, earnings, .keep_all = TRUE)

#Create new superstar variable
starPower <- starPower %>%
  mutate(superstar = ifelse(Rank <= 100, 1, 0))

#Save clean dataset
write_csv(starPower, "../../data/datasets/starPower_cleaned.csv")