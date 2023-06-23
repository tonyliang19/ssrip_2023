read.markdown <- function(file, stringsAsFactors = FALSE, strip.white = TRUE, ...){
  if (length(file) > 1) {
    lines <- file
  } else if (grepl('\n', file)) {
    con <- textConnection(file)
    lines <- readLines(con)
    close(con)
  } else {
    lines <- readLines(file)
  }
  lines <- lines[!grepl('^[[:blank:]+-=:_|]*$', lines)]
  lines <- gsub('(^\\s*?\\|)|(\\|\\s*?$)', '', lines)
  read.delim(text = paste(lines, collapse = '\n'), sep = '|',
             stringsAsFactors = stringsAsFactors, strip.white = strip.white, ...)
}

# Read markdown file and change to dataframe with assigned names
data_tab <- read.markdown("materials/data_table.md")
colnames(data_tab) <- c("Disease/Physiological State", "Datasets",
                        "Number of variables", "Number of samples",
                        "Reference")

