# Data Manipulation and Analysis

`%notin%` = function(x,y) !(x %in% y)


# summary of total # of homeless per county - for use in Table
Total_homeless_by_CoC <- final_df %>%
  filter(pop_category == "Total Homeless Persons") %>%
  select(CoC, emergency_shelter, transitional_housing, unsheltered)

# overall long data format
long_final_df <- final_df %>%
  gather(category, count_people, emergency_shelter, transitional_housing, unsheltered)

# exclude some CoCs that aren't clearly rural
urban_coc = c("Los Angeles", "Santa Clara", "Alameda", "San Francisco")

# convert to long format
long_Total_homeless_by_CoC  <- long_final_df %>% 
  filter(pop_category == "Total Homeless Persons") %>%
  arrange(CoC)
  
  
#  making a viz to check if everything's working okay
Total_homeless_by_CoC_chart <- 
  ggplot(long_Total_homeless_by_CoC, aes(x=CoC, y=count_people)) + 
  geom_bar(aes(fill=category), stat = "identity") +
  coord_flip() + 
  labs(title ="2019 Point in Time Data", x = "Continuum of Care", y = "Total Homeless Persons") +
  scale_fill_discrete(name = "Category", labels = c("Emergency Shelter", "Transitional Housing", "Unsheltered")) +
  theme(legend.position = "bottom")

# CoC's to counties
CoCs_to_counties <- read_csv("CoCs_to_counties.csv")

# entire df with counties
df_by_county <- left_join(CoCs_to_counties, long_final_df, by="CoC")
write.csv(df_by_county, "PIT_by_county.csv")

#just homeless totals with counties
df_by_county2 <- left_join(CoCs_to_counties, long_Total_homeless_by_CoC, by="CoC") %>%
  select(-pop_category) %>%
  group_by(CoC) %>%
  summarize(total_homeless_people_per_CoC = sum(count_people))

write.csv(df_by_county2, "PIT_total_homeless_by_coc.csv")



sapply(df_by_county, function(x) sum(is.na(x)))