#' Generate Rmarkdown file
#' @param input_path A filepath of an excel table to import.
#' @returns Rmarkdown file.
#' @export
#'

create_markdown <- function(input_path){

  df <- read_excel(input_path)

  march_E_value <- as.numeric(df[df$Variables == "E", "March"])
  april_E_value <- as.numeric(df[df$Variables == "E", "April"])

  params <- list(
    para_1 = march_E_value,
    para_2 = april_E_value
  )

  rmd_filename <- system.file("rmd", "testing.rmd", package = "ERSautomation")
  word_filename <- gsub(".Rmd$", ".doc", rmd_filename)

  rmarkdown::render(input = rmd_filename, output_file = word_filename, params = params, envir = new.env())
}

