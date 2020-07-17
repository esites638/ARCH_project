library(readr)

# read in the 3 csvs of PIT links (1 = standard, sw = sorta works, nw = not working)
County_PIT_data_links_1 <- read_csv("County PIT data links_completelyworking.csv")


# extract the columns as separate objects to be inputted into extract_pit()

location_url_1 <- County_PIT_data_links_1$Location_url
county_names_1 <- County_PIT_data_links_1$County


# map extract_pit() over the objects, one for each type of csv 
compiled_df1 <- map2_dfr(location_url_1, county_names_1, extract_pit) # this works! wow

# read in supplementary data
extra_PIT_data <- read.csv("extra_PIT_data.csv", fileEncoding="UTF-8-BOM")

# rowbind the two dataframes
final_df <- rbind.data.frame(compiled_df1, extra_PIT_data)
#final_df <- gsub(",","",final_df)

final_df$emergency_shelter <- as.numeric(as.character(final_df$emergency_shelter))
final_df$transitional_housing <- as.numeric(final_df$transitional_housing)
final_df$unsheltered <- as.numeric(final_df$unsheltered)


# summary of total # of homeless per county
Total_homeless_by_CoC <- final_df %>%
  filter(pop_category == "Total Homeless Persons") %>%
  select(CoC, emergency_shelter, transitional_housing, unsheltered)


# convert to long format
long_Total_homeless_by_CoC  <- Total_homeless_by_CoC %>% 
  gather(category, count_people, emergency_shelter, transitional_housing, unsheltered)

#  making a viz to check if everything's working okay
Total_homeless_by_CoC_chart <- 
  ggplot(long_Total_homeless_by_CoC, aes(x=CoC, y=count_people)) + 
    geom_bar(aes(fill=category), stat = "identity") +
    coord_flip()
