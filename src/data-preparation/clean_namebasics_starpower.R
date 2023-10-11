#Setup
library(tidyverse)
#Read dataset
name_basics_starpower_right <- read_tsv("../../gen/data-preparation/input/name_basics_starPower_merged.tsv")

# The new dataset we create below groups the previous dataset by titles and get the mean ranking of the all actors that are within the title.
# In addition to that, we also included the is_superstar variable, it is 1 if the actor is superstar and 0 if they are not.

name_basics_starpower_new <- name_basics_starpower_right %>% group_by(knownForTitles) %>% summarize(mean_ranking = mean(Rank),
                                                                                                    is_superstar = max(superstar))

# We are checking if our is_superstar dummy variable works with taking the mean_ranking of superstars and compare it to others.

name_basics_starpower_new %>% group_by(is_superstar) %>% summarize(mean_ranking = mean(mean_ranking))

#Save cleaned dataset
write_tsv(name_basics_starpower_new, "../../gen/data-preparation/temp/name_basics_starPower_merged_cleaned.tsv")
