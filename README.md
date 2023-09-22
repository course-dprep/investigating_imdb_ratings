---
Contributors:
  - Lex Vogels
  - Floris van Berloo
  - Kay van der Linden
  - Thomas Gadellaa
  - Mehmet Eren Erdoğan
---

# Investigating the imdb Ratings for Movies & Series
 
## Project Description

In the current digital era of entertainment, where rating systems have a significant impact, it is crucial to understand which factors might influence these ratings. It is clear that external factors such as viewer's satisfaction, perceived quality of the title (movie or tv series), and the place of watching the title might all affect the rating given by the viewer. However, from the perspective of creators, it might be way more interesting to look at factors that can internally be decided. What is the influence of certain actors on title ratings? Which genres tend to be rated higher? And does the consumer enjoy longer or shorter titles? 

The current research aims to deliver useful insights for content makers about which factors actually influence ratings and whether there are differences between the way in which movies are rated versus tv series. 

## Data Availability and Provenance Statements

The project benefits from open-source data that's available on https://datasets.imdbws.com. The available data is presented by IMDb, which is an organisation that is independent from the creators of the movies and tv series we are researching. Furthermore, IMDb is one of the most popular platform for rating movies worldwide. Due to these factors, the information extracted from IMDb can be considered relatively trustworthy.

### Summary of Availability

- [x] All data **are** publicly available on *IMDb Developer*. 
Due to this, the research can easily be replicated and extended during future research projects on IMDb ratings and which variables affect a rating.

### Details on each Data Source
Analysing and predicting Movies & TvSeries ratings, we use four seperate datasets that will be aggregated and merged, such that analysis can be done on one final dataset. The four datasets are listed below, including details on which variables are visible in the dataset and which variables we believe are valuable to our research. 

1. **Title basics**
  From the Title basics dataset we use numerous columns; either as independent variable, moderator, or control variable. Firstly, *Runtime* and *Genres* will be used as two of our independent variables in our research. Additionally, *Title Type* will function as a moderator (*Movies* vs. *Tv Series*). Finally, we consider using using the year the title was launched as a threshold, or as a control variable, because, for example, titles published longer ago have generally received more reviews from so-called "laggards" (late adopters), which might result in lower average ratings than titles that have been published very recently.
2. **Title ratings**
  The Title ratings dataset forms the basis for our Dependent Variable *Average Rating*, while *Number of Votes* can and will be used as a threshhold for movies & series we consider in our analysis.
3. **Title principles**
  The Title principles dataset is used to select only *actors*, *actresses* and *directors* for the list of people who worked on the movie, as these are the the type of people we are interested in when investigating the effect on *ratings*. The actors, actresses and directors extracted from this, will be used as Independent Variables in our model.
4. **Name basics**
  From the Name basics dataset we will extract which actors/actresses/directors are linked to which movie and/or tv series titles. In this way, we can analyse the effect of these people on the rating of a title.
5. **Top 100 actors/actresses**
  This dataset will be used to see if an actor has a "star rating".

## Dataset list

1. title.basics.tsv.gz
2. title.ratings.tsv.gz
3. title.principles.tsv.gz
4. name.basics.tsv.gz
5. *Star rating actors/actresses* 

## Computational requirements

Multiple steps are required before we can start analysing the data extracted. What follows is a short summary of steps required.
1. Download all four datasets seperately.
2. For each dataset, clean the data and prepare for merging.
    
    a. Title basics: delete duplicates, delete columns that will not be used, filter on only movies and tv series (title type), and create dummy variables where needed (genres and title type). Additionally, change "startYear" variable to "time since released". 
    
    b. Title ratings: delete titles that do not reach the threshold of minimum reviews.
    
    c. Title principles: delete columns that will not be used, extract actors and actresses that worked on titles.
    
    d. Name basics: delete columns that will not be used, extract "known for titles" and link names of actors and actresses to the titles. Split "known for titles" into 4 rows.
    
    e. Upload star rating dataset and link to correct actors & actresses from name basics dataset.
3. Merge datasets, which will result in one dataset that shows each movie and tv series once and presents its title id, title, title type, time elapsed since launch, runtime, genre(s), average rating, number of votes, actors and actresses, and star rating.
4. Sample the final dataset to an X number of rows, such that analysis can be done easily.
5. Run multiple regression analysis, using the variables previously described.