#' Generate Rmarkdown file
#' @param input_path A filepath of an excel table to import.
#' @returns Rmarkdown file.
#' @export
#'

create_markdown_hfm <- function(input_path){

   params <- list(
     para_1 = input_path
)

  rmd_filename <- system.file("rmd", "hfm_trial.rmd", package = "ERSautomation")
  word_filename <- gsub(".Rmd$", ".doc", rmd_filename)

  rmarkdown::render(input = rmd_filename, output_file = word_filename, params = params, envir = new.env())

}

# test <- read_excel("Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240517.xlsx",
#                     sheet = "Table_R1(b)_-_RS_month", skip = 3)
# create_markdown_hfm(input_path = "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240517.xlsx")

