all: analysis data-preparation

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean:
	R -e "unlink('*.tsv')"    
	R -e "unlink('*.csv')"
	R -e "unlink('*.gz')"