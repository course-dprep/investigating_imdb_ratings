RMD_FILE = linear_regression_analysis.Rmd
HTML_OUTPUT = linear_regression_analysis.html


../../gen/analysis/output/html: $(RMD_FILE)
	Rscript -e "rmarkdown::render('$<', output_file = '../../gen/analysis/output/$(HTML_OUTPUT)')"

clean:
	rm -f $(HTML_OUTPUT)