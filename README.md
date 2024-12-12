# Rough Sleeping Data Framework

This project creates a word document of the Rough Sleeping Data Framework publication that is used to create a word document to review before publication.

## Getting Started

### Prerequisites

Access on the DAP to folder *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping*

## Running the code

Check (and **update** if required) the input path. It should be using the most recently generated publication tables,

`input_path <- "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tablesXXXXXX.xlsx`"

(To find the name of the most recent table look in *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping\\RS MI R\\New monthly tables script\\Git_Version\\Publication_tables)*)

In the console run the following 3 steps;

devtools::document()

devtools::load_all()

`create_markdown_hfm(input_path = "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tablesXXXXXX.xlsx")` *(Replace the XXXXXX with the name of the most recent tables, this should match the input path)*

The word document output will be located in *Q:\\ASCT\\P005 Homelessness\\008 Rough Sleeping\\RS MI R\\New monthly tables script\\Git_Version\\Publication_word*
