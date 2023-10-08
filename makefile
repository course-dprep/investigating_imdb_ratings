DATA = data
TEMP = gen/data-preparation/temp
INPUT = gen/data-preparation/input
OUTPUT = gen/data-preparation/output

all: analysis data-preparation

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean:
	R -e "unlink('$(DATA)/*.tsv')"    
	R -e "unlink('$(DATA)/*.csv')"
	R -e "unlink('$(DATA)/*.gz')"
	R -e "unlink('$(TEMP)/*.tsv')"    
	R -e "unlink('$(TEMP)/*.csv')"
	R -e "unlink('$(TEMP)/*.gz')"
	R -e "unlink('$(INPUT)/*.tsv')"    
	R -e "unlink('$(INPUT)/*.csv')"
	R -e "unlink('$(INPUT)/*.gz')"
	R -e "unlink('$(OUTPUT)/*.tsv')"    
	R -e "unlink('$(OUTPUT)/*.csv')"
	R -e "unlink('$(OUTPUT)/*.gz')"