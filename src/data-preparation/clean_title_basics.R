#Setup
#Loading packages
library(tidyverse)
library(readr)
#Read dataset
title_basics <- read_tsv("../../data/title_basics.tsv")

#filter for only Movies and tvSeries
title_basics <- title_basics %>% 
  filter(titleType == "movie" | titleType == "tvSeries")

#Order for startYear
title_basics <- title_basics %>% 
  arrange(startYear)

#Changing startYear to a numeric variable
class(title_basics$startYear) #startYear is a character variable
title_basics$startYear <- as.numeric(format(title_basics$startYear, format = "%Y"), na.rm = TRUE) #change startYear to a date variable
#print(title_basics$startYear) #what does the variable look like?
#class(title_basics$startYear) #check if it worked; it did!

#Adding variable for current year (numberic)
current_time <- Sys.time() #save current time as a variable
current_date <- as.Date(current_time, format = "%Y") #convert the current time to a date
current_date <- as.numeric(format(current_date, format = "%Y"))
#print(current_date) #it worked

#Calculate years passed since release and create a new variable for this
title_basics <- title_basics %>%
  filter(!is.na(startYear)) %>% 
  mutate(time_since_release = current_date - startYear)

#Checking how many observations have different original and primary title.
title_basics %>% filter(primaryTitle != originalTitle) %>% count() #There are 92989 out of 905877.
#It's about 9 percent. Primary titles and Original are often the same --> keep only primary title.
#Keeping just the primary title columns.
title_basics <- title_basics %>% select(-originalTitle)

#Checking how many adult movies are in the database.
title_basics %>% filter(isAdult == 1) %>% count() #12388 Adult movies
title_basics <- title_basics %>% filter(isAdult == 0) %>% select(-isAdult) #Remove adult movies, since not interested in this

#Also removing the endYear column
title_basics <- title_basics %>% select(-endYear)

#Save cleaned dataset
write_tsv(title_basics, "../../gen/data-preparation/temp/title_basics_cleaned.tsv")


