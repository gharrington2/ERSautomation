# Rough Sleeping Data Framework

This project creates a word document of the Rough Sleeping Data Framework publication that is used to review before publication.

## Getting Started

### Prerequisites

You will need access on the DAP to *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping*

## Running the code

Check that the input path is using the most recently generated tables,

`input_path <- "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240730.xlsx`"

(If you need to check the name of the most recent table look in *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping\\RS MI R\\New monthly tables script\\Git_Version\\Publication_tables)*)

In the console run the following

`Document()`

`Load_all()`

Or 

devtools::document()

devtools::load_all()

`create_markdown_hfm(input_path = "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240730.xlsx")` *(if you have updated the input path this needs amending here too)*

The word document output will be located in *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping\\RS MI R\\New monthly tables script\\Git_Version\\Publication_word*
