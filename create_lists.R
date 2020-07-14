library(readr)

# read in the 3 csvs of PIT links (1 = standard, sw = sorta works, nw = not working)
County_PIT_data_links_1 <- read_csv("County PIT data links_completelyworking.csv")
County_PIT_data_links_sw <- read_csv("county_pit_sortaworking.csv")
County_PIT_data_links_nw <- read_csv("PIT_notworking.csv")

# extract the columns as separate objects to be inputted into extract_pit()

location_url_1 <- County_PIT_data_links_1$Location_url
county_names_1 <- County_PIT_data_links_1$County


location_url_sw <- County_PIT_data_links_sw$Location_url
county_names_sw <- County_PIT_data_links_sw$County


location_url_nw <- County_PIT_data_links_nw$Location_url
county_names_nw <- County_PIT_data_links_nw$County


# map extract_pit() over the objects, one for each type of csv 
compiled_df1 <- map2_dfr(location_url_1, county_names_1, extract_pit) # this works! wow

# write to csv
write.csv(compiled_df1, "Compiled PIT data.csv")

