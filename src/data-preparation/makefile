name_basics_starPower_merged_cleaned.tsv: clean_namebasics_starPower.R name_basics_starPower_merged.tsv
	Rscript clean_namebasics_starPower.R

name_basics_starPower_merged.tsv: merge_namebasics_starPower.R starPower_cleaned.csv name_basics_cleaned.tsv
	Rscript merge_namebasics_starPower.R

starPower_cleaned.csv: clean_starpower.R starPower.csv
	Rscript clean_starpower.R

name_basics_cleaned.tsv: clean_name_basics.R name_basics.tsv
	Rscript clean_name_basics.R

title_rating_cleaned.tsv: clean_title_ratings.R title_ratings.tsv
	Rscript clean_title_ratings.R

title_basics_cleaned.tsv: clean_title_basics.R title_basics.tsv
	Rscript clean_title_basics.R

starPower.csv title_basics.tsv title_ratings.tsv name_basics.tsv: download.R
	Rscript download.R