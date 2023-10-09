---
Contributors:
  - Lex Vogels
  - Floris van Berloo
  - Kay van der Linden
  - Thomas Gadellaa
  - Mehmet Eren Erdoğan
---

# Investigating the predictors of IMDb Ratings for Movies & Series
 
## Project Description

In the current digital era of entertainment, where rating systems have a significant impact, it is crucial to understand which factors might influence these ratings. It is clear that external factors such as viewer's satisfaction, perceived quality of the title (movie or tv series), and the place of watching the title might all affect the rating given by the viewer. However, from the perspective of creators, it might be way more interesting to look at factors that can internally be decided. What is the influence of certain actors on title ratings? Which genres tend to be rated higher? And does the consumer enjoy longer or shorter titles? 

The current research aims to deliver useful insights for content makers about which factors actually influence ratings and whether there are differences between the way in which movies are rated versus tv series. 

## Data Availability and Provenance Statements

The project benefits from open-source data that's available on https://datasets.imdbws.com. The available data is presented by IMDb, which is an organisation that is independent from the creators of the movies and tv series we are researching. Furthermore, IMDb is one of the most popular platforms for rating movies worldwide. Due to these factors, the information extracted from IMDb can be considered relatively trustworthy. Furthermore, a dataset that was previously created using information from https://www.the-numbers.com/ will be used to measure "Star power" of actors. Since this information is also available to the public, we can use it for our research. The dataset has been downloaded from a dropbox link that can be shared/used by future researchers.

### Summary of Availability

All used data sources are publicly available on *IMDb Developer* and *the-numbers* (dropbox).
Due to this, the research can easily be replicated and extended during future research projects on IMDb ratings and which variables affect a rating of a movie and/or tv series. 

### Details on each Data Source
Analysing and predicting movies & tv series ratings, we use four seperate datasets that will be prepared and merged, such that an analysis can be done on one final dataset. The four datasets are listed below, including details on which variables are visible in the dataset and which variables we believe are valuable to our research. Therefore, this also elaborates on some of the cleaning process.

1. **Title basics**
  From the Title basics dataset we use numerous columns; either as independent variable, moderator, or control variable. Firstly, *Runtime* and *Genres* will be used as two of our independent variables in our research. Additionally, *Title Type* will function as a moderator (*movies* vs. *tv series*). Finally, we are using the year the title was launched as a control variable, because, for example, titles published longer ago have generally received more reviews from so-called "laggards" (late adopters), which might result in lower average ratings than titles that have been published very recently.
2. **Title ratings**
  The Title ratings dataset forms the basis for our dependent variable *Average Rating*, while *Number of Votes* can and will be used as a threshhold for movies & series we consider in our analysis.
3. **Name basics**
  From the Name basics dataset we will extract which actors/actresses are linked to which movie and/or tv series titles. In this way, we can analyse the effect of these people on the rating of a title. Therefore, the actor/actress will be one of the independent variables.
4. **Star power**
  This dataset will be used to compute the average ranking of all the ranked actors in the movie/series. Additionally, we will create a dummy variable for whether actors are considered "super stars".

## Dataset list

1. title_basics.tsv
2. title_ratings.tsv
3. name_basics.tsv
4. starPower.csv 

## Computational requirements

Multiple steps are required before we can start analysing the data extracted. What follows is a short summary of steps required.
1. Download all four datasets seperately.
2. Investigate the data, which we have documented in an RMarkdown file.
3. For each dataset, clean the data and prepare for merging.
    
    a. Title basics: delete duplicates, delete columns that will not be used, filter on only movies and tv series (title type), and create dummy variables where needed (genres). Additionally, change the "startYear" variable to a variable that shows us the number of years since it was released (numeric). We also remove "isAdult" movies, as we are not interested in these titles. Finally, we remove the "Original title" column and keep the "Primary title" column.
    
    b. Title ratings: delete titles that have an incorrect ratings, as ratings should be somewhere between 1 and 10. Additionally, we remove titles that do not have any rating.
    
    c. Name basics: delete the columns that will not be used (birth year and death year). Furthermore, we filter "primary profession" for actors and actresses only and the "known for titles" variable is split, such that each title is displayed on a row.
    
    d. Star power: Filter on "actor" category only (actors and actresses) and remove duplicates. Additionally, we add a "superstar" dummy variable for actors/actresses that have a ranking of 1-100. 
4. Merge dataset "title basics" with "title ratings" and merge dataset "name basics" with "star power".
5. We do some additional cleaning:
    
    a. Title basics & Title ratings: add a dummy variable for five of the most common genres: "Drama", "Comedy", "Documentary", "Romance", and "Action". In future research, this list can easily be extended with more genres that are indicated by IMDb.
    b. Name basics & Star power: for each movie/series, we compute the average ranking of all the actors/actresses' in the title.
6. Merge two cleaned and merged datasets described above, which will result in one final dataset that can be used for analysis.
7. Sample the final dataset to an X number of rows (researchers who replicate should decide on sampling when doing analysis), such that analysis can be done easily.
8. Run the analyses, using the variables previously described.