

df_month_new <- read_excel(path = "Q:/ASCT/P005 Homelessness/008 Rough Sleeping/RS MI R/New monthly tables script/Git_Version/Publication_tables/Publication_tables240517.xlsx", sheet = "Table_P1(b)_-_RS_month_new", skip = 3)

march24_month_new_eng <- as.numeric(df_month_new[1, "2024_03_01"])
