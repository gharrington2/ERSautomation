#' Generate Rmarkdown file
#' @param input_path A filepath of an excel table to import.
#' @returns Rmarkdown file.
#' @export
#'

create_markdown_hfm <- function(input_path){

  df_month_new <- read_excel(input_path, sheet = "Table_P1(b)_-_RS_month_new", skip = 3)
  df_month <- read_excel(input_path, sheet = "Table_R1(b)_-_RS_month", skip = 3)

  march24_month_new_eng <- as.numeric(df_month_new[1, "2024_03_01"])
  march23_month_new_eng <- as.numeric(df_month_new[1, "2023_03_01"])

  march24_month_eng <- as.numeric(df_month[1, "March 2024"])
  march23_month_eng <- as.numeric(df_month[1, "March 2023"])


  params <- list(
    para_1 = march24_month_new_eng,
    para_2 = march23_month_new_eng,
    para_3 = march24_month_eng,
    para_4 = march23_month_eng
  )

  rmd_filename <- system.file("rmd", "hfm_trial.rmd", package = "ERSautomation")
  word_filename <- gsub(".Rmd$", ".doc", rmd_filename)

  rmarkdown::render(input = rmd_filename, output_file = word_filename, params = params, envir = new.env())
}

 # test <- read_excel("Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240517.xlsx",
 #                    sheet = "Table_R1(b)_-_RS_month", skip = 3)



