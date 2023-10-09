RMD_FILE = linear_regression_analysis.Rmd
HTML_OUTPUT = linear_regression_analysis.html


html: $(RMD_FILE)
	Rscript -e "rmarkdown::render('$<', output_file = '$(HTML_OUTPUT)')"

clean:
	rm -f $(HTML_OUTPUT)