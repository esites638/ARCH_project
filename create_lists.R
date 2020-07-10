library(readr)
County_PIT_data_links <- read_csv("County PIT data links.csv")

location_url <- County_PIT_data_links["Location_url"]
county_names <- County_PIT_data_links["County"]