# Define a function to download data from a URL and save it to a specified location. This is based on code from one of the tutorials
download_data <- function(url, filename, file_extension, destination_dir) {
  # Create the full destination path by combining the destination directory, filename, and file extension
  destfile <- file.path(destination_dir, paste0(filename, file_extension))
  
  # Attempt to download the file from the specified URL with error handling
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
    
    # Due to the IMDb files being compressed, we check if a file is a .gz file. If so, extract its contents
    if (file_extension == ".gz") {
      # Create a path for the extracted file
      destfile_extracted <- file.path(destination_dir, gsub("\\.gz$", "", filename))
      
      # Open the .gz file for reading
      gzcon <- gzfile(destfile, "rb")
      
      # Create a new file for writing the extracted data
      output_file <- file(destfile_extracted, "w")
      
      # Read and write each line from the .gz file to the new file
      while (length(line <- readLines(gzcon, n = 1)) > 0) {
        writeLines(line, output_file)
      }
      
      # Close the files
      close(gzcon)
      close(output_file)
      
      # Provide feedback about the extraction process
      cat("File", filename, "extracted successfully.\n")
      
      # Delete the original .gz file to save space
      file.remove(destfile)
      cat("File", filename, ".gz deleted.\n")
    }
  } else {
    cat("Failed to download", filename, "\n")
  }
  
  # Return the full destination path of the downloaded file
  return(destfile)
}

# Define a list of URLs and corresponding filenames and file extensions
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

# Specify the relative directory where you want to save the downloaded files
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
