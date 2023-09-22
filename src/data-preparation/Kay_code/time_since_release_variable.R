#Writing a code for adding a new variable "time since release"

#Loading packages
library(tidyverse)
library(readr)
#load in dataset
title.basics <- read_tsv("../../../data/title.basics.tsv.gz")

#filter for only movies and tvSeries
title.basics <- title.basics %>% 
  filter(titleType == "movie" | titleType == "tvSeries")

#create random sample using a seed
set.seed(100)
temp_sample <- title.basics[sample.int(nrow(title.basics),1000),]

#order for years
temp_sample <- temp_sample %>% 
  arrange(startYear)

#changing startYear to a numeric variable
class(temp_sample$startYear) #startYear is a character variable
temp_sample$startYear <- as.numeric(format(temp_sample$startYear, format = "%Y"), na.rm = TRUE) #change startYear to a date variable
print(temp_sample$startYear) #what does the variable look like?
class(temp_sample$startYear) #check if it worked; it did!

#adding variable for current year
current_time <- Sys.time() #save current time as a variable
current_date <- as.Date(current_time, format = "%Y") #convert the current time to a date
current_date <- as.numeric(format(current_date, format = "%Y"))
print(current_date) #it worked

#calculate years passed since release
temp_sample <- temp_sample %>%
  filter(!is.na(startYear)) %>% 
  mutate(time_since_release = current_date - startYear)
