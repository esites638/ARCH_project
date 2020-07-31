library(readr)
library(tidyverse)


# read in the csv of PIT links that work completely
County_PIT_data_links_1 <- read_csv("County PIT data links_completelyworking.csv")


# extract the columns as separate objects to be inputted into extract_pit()

location_url_1 <- County_PIT_data_links_1$Location_url
county_names_1 <- County_PIT_data_links_1$County


# map extract_pit() over the objects, one for each type of csv 
compiled_df1 <- map2_dfr(location_url_1, county_names_1, extract_pit) # this works! wow

# remove commas from counts and convert to numeric
compiled_df1$unsheltered <- as.numeric(gsub(",","",compiled_df1$unsheltered))
compiled_df1$emergency_shelter <- as.numeric(gsub(",","",compiled_df1$emergency_shelter))
compiled_df1$transitional_housing <- as.numeric(gsub(",","",compiled_df1$transitional_housing))


# read in supplementary data
extra_PIT_data <- read.csv("extra_PIT_data.csv", fileEncoding="UTF-8-BOM")

# rowbind the two dataframes
final_df <- rbind.data.frame(compiled_df1, extra_PIT_data)

# check that final_df has no NAs
sapply(final_df, function(x) sum(is.na(x)))



