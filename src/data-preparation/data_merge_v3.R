library(tidyverse) # I'm just loading the 'tidyverse' package.

title_basics <- read_tsv("title.basics.tsv.gz") # I'm reading the title.basics database in.

title_ratings <- read_tsv("title.ratings.tsv.gz") # Doing the same for the title.ratings.

title_basics_ratings <- inner_join(title_basics, title_ratings) # I'm joining those two with inner_join()

title_principals <- read_tsv("title.principals.tsv.gz") # Reading the title.principals in.

title_basics_ratings_principals <- inner_join(title_basics_ratings, title_principals) # Joining again.

title_basics_ratings_principals <- title_basics_ratings_principals %>% 
  filter(category %in% c("actor", "actress")) # I'm filtering the category with 2 variables thanks to %in%.

title_basics_ratings_principals <- unique(title_basics_ratings_principals$primaryTitle) #I'm taking
#the unique values with unique() function and that's all!


