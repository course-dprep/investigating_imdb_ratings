#SET-UP
library(tidyverse)
library(readr)

# Read the dataset
title_basics_ratings_merged <- read_tsv("../../gen/data-preparation/input/title_basics_ratings_merged.tsv")

# Define the top genres
top_genres <- c("Drama", "Comedy", "Documentary", "Romance", "Action")

# Create binary indicator columns for genres
for (genre in top_genres) {
  title_basics_ratings_merged[[genre]] <- as.integer(grepl(genre, title_basics_ratings_merged$genres, ignore.case = TRUE))
}

# Initialize the "Other" column with 1
title_basics_ratings_merged$Other <- 1

# Create the "Other" column using apply and grepl
title_basics_ratings_merged$Other <- apply(title_basics_ratings_merged, 1, function(row) {
  genres_list <- unlist(strsplit(row["genres"], ",")) # Split genres into a list
  if (all(genres_list %in% top_genres)) {
    return(0)
  }
  return(1)
})

# Save The Cleaned Dataset
write_tsv(title_basics_ratings_merged, '../../gen/data-preparation/input/title_basics_ratings_genre_merged.tsv')



