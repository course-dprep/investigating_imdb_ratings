#Writing a code for adding a new variable "time since release"

#Loading packages
library(tidyverse)
library(readr)
#load in dataset
title.basics <- read_tsv("../../data/dataset2/title.basics.tsv.gz") # Don't forget to change here

#filter for only movies and tvSeries
title.basics <- title.basics %>% 
  filter(titleType == "movie" | titleType == "tvSeries")

#order for years
title.basics <- title.basics %>% 
  arrange(startYear)

#changing startYear to a numeric variable
class(title.basics$startYear) #startYear is a character variable
title.basics$startYear <- as.numeric(format(title.basics$startYear, format = "%Y"), na.rm = TRUE) #change startYear to a date variable
print(title.basics$startYear) #what does the variable look like?
class(title.basics$startYear) #check if it worked; it did!

#adding variable for current year
current_time <- Sys.time() #save current time as a variable
current_date <- as.Date(current_time, format = "%Y") #convert the current time to a date
current_date <- as.numeric(format(current_date, format = "%Y"))
print(current_date) #it worked

#calculate years passed since release
title.basics <- title.basics %>%
  filter(!is.na(startYear)) %>% 
  mutate(time_since_release = current_date - startYear)

#Checking how many observations have different original and primary title.

title.basics %>% filter(primaryTitle != originalTitle) %>% count() # There are 92989 out of 905877.
# It's about 9 percent. We can safely remove them in my opinion.

# Keeping just the primary titles.

title.basics <- title.basics %>% select(-originalTitle)

# Checking how many adult movies are in the database.

title.basics %>% filter(isAdult == 1) %>% count() # It says 12388. We can safely remove them.

title.basics <- title.basics %>% filter(isAdult == 0) %>% select(-isAdult)

# Also removing the endYear after Kay's dealt with it.

title.basics <- title.basics %>% select(-endYear)

# Dealing with genres column if Thomas can't manage it.

title.basics <- title.basics %>% separate(genres, into = c("genre_1", "genre_2", "genre_3"), sep = ",")

title.basics <- title.basics %>% pivot_longer(cols = c(genre_1, genre_2, genre_3), names_to = "genres", values_to = "genre_name")

title.basics <- title.basics %>% drop_na(genre_name)
