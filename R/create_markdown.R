#' Generate Rmarkdown file
#' @param input_path A filepath of an excel table to import.
#' @param output_path A filepath of an excel table to export
#' @returns Rmarkdown file.
#' @export
#'

create_markdown <- function(input_path, output_path){

  df <- read_excel(input_path)

  write_xlsx(df, output_path)

}

