DATA = ../../data
TEMP = ../../gen/data-preparation/temp
INPUT = ../../gen/data-preparation/input
OUTPUT = ../../gen/data-preparation/output

all: $(OUTPUT)/final_merged_dataset.tsv

$(OUTPUT)/final_merged_dataset.tsv: $(TEMP)/name_basics_starPower_merged_cleaned.tsv $(INPUT)/title_basics_ratings_merged.tsv merge_all_final.R
	Rscript merge_all_final.R

$(INPUT)/title_basics_ratings_merged.tsv: $(TEMP)/title_ratings_cleaned.tsv $(TEMP)/title_basics_cleaned.tsv merge_title_basics_title_ratings.R
	Rscript merge_title_basics_title_ratings.R

$(TEMP)/name_basics_starPower_merged_cleaned.tsv: $(INPUT)/name_basics_starPower_merged.tsv clean_namebasics_starPower.R
	Rscript clean_namebasics_starPower.R

$(INPUT)/name_basics_starPower_merged.tsv: $(TEMP)/starPower_cleaned.csv $(TEMP)/name_basics_cleaned.tsv merge_namebasics_starPower.R
	Rscript merge_namebasics_starPower.R

$(TEMP)/starPower_cleaned.csv: $(DATA)/starPower.csv clean_starpower.R
	Rscript clean_starpower.R

$(TEMP)/name_basics_cleaned.tsv: $(DATA)/name_basics.tsv clean_name_basics.R
	Rscript clean_name_basics.R

$(TEMP)/title_ratings_cleaned.tsv: $(DATA)/title_ratings.tsv clean_title_ratings.R
	Rscript clean_title_ratings.R

$(TEMP)/title_basics_cleaned.tsv: $(DATA)/title_basics.tsv clean_title_basics.R
	Rscript clean_title_basics.R

$(DATA)/starPower.csv $(DATA)/title_basics.tsv $(DATA)/title_ratings.tsv $(DATA)/name_basics.tsv: download.R
	Rscript download.R
