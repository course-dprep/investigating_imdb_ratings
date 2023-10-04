# Function to download data and save with specified filename and file extension
download_data <- function(url, filename, file_extension, destination_dir) {
  # Combine the destination directory, filename, and file extension
  destfile <- file.path(destination_dir, paste0(filename, file_extension))
  
  # Download the file with error handling
  tryCatch(
    {
      download.file(url = url, destfile = destfile)
    },
    error = function(e) {
      cat("Error downloading", filename, ":", conditionMessage(e), "\n")
    }
  )
  
  # Check if the file was downloaded successfully
  if (file.exists(destfile)) {
    cat("File", filename, "downloaded successfully.\n")
    
    # If the file is a .gz file, extract it
    if (file_extension == ".gz") {
      destfile_extracted <- file.path(destination_dir, gsub("\\.gz$", "", filename))
      gzcon <- gzfile(destfile, "rb")
      output_file <- file(destfile_extracted, "w")
      while (length(line <- readLines(gzcon, n = 1)) > 0) {
        writeLines(line, output_file)
      }
      close(gzcon)
      close(output_file)
      cat("File", filename, "extracted successfully.\n")
      
      # Delete the original .gz file
      file.remove(destfile)
      cat("File", filename, ".gz deleted.\n")
    }
  } else {
    cat("Failed to download", filename, "\n")
  }
  
  # Return the full destination path
  return(destfile)
}

# List of URLs and filenames
download_list <- list(
  list(
    url = "https://www.dropbox.com/scl/fi/f9nwgy1bayvt0hz1a9uzc/superstar_persons.csv?rlkey=asw9hywpj3yyojvtb5fm379su&dl=1",
    filename = "starPower",
    file_extension = ".csv"
  ),
  list(
    url = "https://datasets.imdbws.com/title.basics.tsv.gz",
    filename = "title_basics.tsv",
    file_extension = ".gz"
  ),
  list(
    url = "https://datasets.imdbws.com/title.ratings.tsv.gz",
    filename = "title_ratings.tsv",
    file_extension = ".gz"
  ),
  list(
    url = "https://datasets.imdbws.com/name.basics.tsv.gz",
    filename = "name_basics.tsv",
    file_extension = ".gz"
  )
)

# Specify the relative path where you want to save the files
destination_directory <- "../../data"

# Loop through the download list and download/extract each file
for (download_item in download_list) {
  download_data(
    url = download_item$url,
    filename = download_item$filename,
    file_extension = download_item$file_extension,
    destination_dir = destination_directory
  )
}
