DATA = ../../data/datasets

all: $(DATA)/starPower.csv $(DATA)/title_basics.tsv $(DATA)/title_ratings.tsv $(DATA)/name_basics.tsv $(DATA)/title_basics_cleaned.tsv $(DATA)/title_ratings_cleaned.tsv $(DATA)/name_basics_cleaned.tsv $(DATA)/starPower_cleaned.csv $(DATA)/name_basics_starPower_merged.tsv $(DATA)/name_basics_starPower_merged_cleaned.tsv $(DATA)/title_basics_ratings_merged.tsv $(DATA)/final_merged_dataset.tsv

../../data/datasets/final_merged_dataset.tsv: ../../data/datasets/name_basics_starPower_merged.tsv ../../data/datasets/title_basics_ratings_merged.tsv merge_all_final.R
	Rscript merge_all_final.R

../../data/datasets/title_basics_ratings_merged.tsv: ../../data/datasets/title_ratings_cleaned.tsv ../../data/datasets/title_basics_cleaned.tsv merge_title_basics_title_ratings.R
	Rscript merge_title_basics_title_ratings.R

../../data/datasets/name_basics_starPower_merged_cleaned.tsv: ../../data/datasets/name_basics_starPower_merged.tsv clean_namebasics_starPower.R
	Rscript clean_namebasics_starPower.R

../../data/datasets/name_basics_starPower_merged.tsv: ../../data/datasets/starPower_cleaned.csv ../../data/datasets/name_basics_cleaned.tsv merge_namebasics_starPower.R
	Rscript merge_namebasics_starPower.R

../../data/datasets/starPower_cleaned.csv: ../../data/datasets/starPower.csv clean_starpower.R
	Rscript clean_starpower.R

../../data/datasets/name_basics_cleaned.tsv: ../../data/datasets/name_basics.tsv clean_name_basics.R
	Rscript clean_name_basics.R

../../data/datasets/title_ratings_cleaned.tsv: ../../data/datasets/title_ratings.tsv clean_title_ratings.R
	Rscript clean_title_ratings.R

../../data/datasets/title_basics_cleaned.tsv: ../../data/datasets/title_basics.tsv clean_title_basics.R
	Rscript clean_title_basics.R

../../data/datasets/starPower.csv ../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv ../../data/datasets/name_basics.tsv: download.R
	Rscript download.R