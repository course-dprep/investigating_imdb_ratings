#Setup
library(tidyverse)
#load the dataset:
title.ratings <- read_tsv("../../data/datasets/title_ratings.tsv")

#Data preparation Title.ratings data set

#filter for average ratings < 1 or > 10

title.ratings<-title.ratings %>% filter(averageRating>=1 & averageRating<=10)

#filter for NA in average rating and number of votes

tilte.ratings <- title.ratings %>% filter(!is.na(averageRating), !is.na(numVotes ))

write_tsv(title.ratings, "../../data/datasets/title_ratings_cleaned.tsv")