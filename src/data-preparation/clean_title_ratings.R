#Setup
library(tidyverse)
#load the dataset:
title_ratings <- read_tsv("../../data/title_ratings.tsv")

#Data preparation Title.ratings data set

#Filter for average ratings < 1 or > 10

title_ratings <- title_ratings %>% filter(averageRating>=1 & averageRating<=10)

#Filter for NA in average rating and number of votes

tilte_ratings <- title_ratings %>% filter(!is.na(averageRating), !is.na(numVotes ))

#Save cleaned dataset
write_tsv(title_ratings, "../../gen/data-preparation/temp/title_ratings_cleaned.tsv")
