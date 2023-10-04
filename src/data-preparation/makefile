DATA = $(DATA)

all: $(DATA)/final_merged_dataset.tsv

$(DATA)/final_merged_dataset.tsv: $(DATA)/name_basics_starPower_merged.tsv $(DATA)/title_basics_ratings_merged.tsv merge_all_final.R
	Rscript merge_all_final.R

$(DATA)/title_basics_ratings_merged.tsv: $(DATA)/title_ratings_cleaned.tsv $(DATA)/title_basics_cleaned.tsv merge_title_basics_title_ratings.R
	Rscript merge_title_basics_title_ratings.R

$(DATA)/name_basics_starPower_merged_cleaned.tsv: $(DATA)/name_basics_starPower_merged.tsv clean_namebasics_starPower.R
	Rscript clean_namebasics_starPower.R

$(DATA)/name_basics_starPower_merged.tsv: $(DATA)/starPower_cleaned.csv $(DATA)/name_basics_cleaned.tsv merge_namebasics_starPower.R
	Rscript merge_namebasics_starPower.R

$(DATA)/starPower_cleaned.csv: $(DATA)/starPower.csv clean_starpower.R
	Rscript clean_starpower.R

$(DATA)/name_basics_cleaned.tsv: $(DATA)/name_basics.tsv clean_name_basics.R
	Rscript clean_name_basics.R

$(DATA)/title_ratings_cleaned.tsv: $(DATA)/title_ratings.tsv clean_title_ratings.R
	Rscript clean_title_ratings.R

$(DATA)/title_basics_cleaned.tsv: $(DATA)/title_basics.tsv clean_title_basics.R
	Rscript clean_title_basics.R

$(DATA)/starPower.csv $(DATA)/title_basics.tsv $(DATA)/title_ratings.tsv $(DATA)/name_basics.tsv: download.R
	Rscript download.R
