# Data Analisys

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