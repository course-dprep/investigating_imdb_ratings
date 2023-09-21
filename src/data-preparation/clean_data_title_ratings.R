# data preparation Title.ratings data set
library(tidyverse)

#load the dataset:
title_ratings <- read_tsv("../../data/datasets/title.ratings.tsv.gz")

#filter for average ratings < 1 or > 10

title_ratings<-title_ratings %>% filter(averageRating>=1 & averageRating<=10)
