library(officer)

# Render the R Markdown document
# rmarkdown::render("your_document.Rmd")

setwd("D:/Users/hudson.fm/Documents/GitHub/ERSautomation/inst/rmd")
# Load the rendered document
doc <- read_docx("hfm_trial.docx")

# Apply the GreyBox style
doc <- doc %>%
  cursor_reach(keyword = "Text to be in grey box") %>%
  body_add_par("Text to be in grey box", style = "GreyBox")

# Save the modified document
print(doc, target = "styled_document.docx")
