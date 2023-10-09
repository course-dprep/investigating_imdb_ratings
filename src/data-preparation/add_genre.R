#SET-UP
library(tidyverse)
library(readr)

# Read in the dataset
title_basics_ratings_merged <- read_tsv("../../gen/data-preparation/input/title_basics_ratings_merged.tsv")

# Calculate the most frequent genres -> We want to meassure the effect of the genres, however, 
#if we want to create a new column for each genre, the dataset gets very messy. Therefore we opted to create new columns for the top 5 genres.
#Genres that do not fit in the top 5 are placed under the column 'Other'
# Split genres into individual values and clean up leading/trailing spaces
all_genres <- unlist(strsplit(title_basics_ratings_merged$genres, ","))
all_genres <- trimws(all_genres)

# Count the frequency of each genre
genre_counts <- table(all_genres)
sorted_counts <- sort(genre_counts, decreasing = TRUE)

# Display the top 5 most frequent genres
top_genres <- head(names(sorted_counts), 5)
print(top_genres)

# Based on the top 5 genres, we define the genres we want to create binary indicator columns for.
top_genres <- c("Drama", "Comedy", "Documentary", "Romance", "Action")

# Create binary indicator columns for genres using a loop.
for (genre in top_genres) {
  title_basics_ratings_merged[[genre]] <- as.integer(grepl(genre, title_basics_ratings_merged$genres, ignore.case = TRUE))
}

# Initialize the "Other" column with 1 for now.
title_basics_ratings_merged$Other <- 1

# We create the "Other" column using the apply function and grepl.
title_basics_ratings_merged$Other <- apply(title_basics_ratings_merged, 1, function(row) {
  genres_list <- unlist(strsplit(row["genres"], ",")) # Split genres into a list
  if (all(genres_list %in% top_genres)) {
    return(0)
  }
  return(1)
})

# Save The Cleaned Dataset
write_tsv(title_basics_ratings_merged, '../../gen/data-preparation/input/title_basics_ratings_genre_merged.tsv')



