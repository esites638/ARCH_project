# sw's are not reading in all of page 1
# stanislaus (510), napa (517), imperial (613), santa clara (500)

#extract_pit <- function(url, coc_name){
# url of pdf file
location <- 'https://files.hudexchange.info/reports/published/CoC_PopSub_CoC_CA-5000-2019_CA_2019.pdf'


# Extract the tables into a list of 2 matrices, one for each page
out <- extract_tables(location)

# matrices don't have the same # of columns
# Column names
headers <- c('pop_category', 'emergency_shelter', 'transitional_housing', 'unsheltered')


#clean up page 1
p1 <- do.call(rbind, out[-length(out)]) # columns 2 and 4 are blank...and table 2 of page 1 is missing

p1_df <- as.data.frame(p1)
p1_df_clean <- as.data.frame(p1_df[-c(2,4)]) #extra blank columns are removed
names(p1_df_clean) <- headers

# clean up page 2
p2 <- do.call(rbind, out[length(out)]) #page 2 has 2 extra columns at the end
p2_df <- as.data.frame(p2)
p2_df_clean <- as.data.frame(p2_df[-c(5,6)]) 
names(p2_df_clean) <- headers


# combine the two matrices into a single matrix
bound_list <- list(p1_df_clean, p2_df_clean)
bound <- do.call(rbind, bound_list)

# conver matrix to data frame, clean up rows and columns
reference_df <- as.data.frame(bound)
df <- as.data.frame(reference_df[-c(1:3, 8, 18:20, 23:24, 29:30, 37:40, 42, 46:47), ])

# TO-Do: deal with the fact that tabulizer doesn't treat the pdfs equally...then apply the function to the list of counties/urls

df1 <- df %>%
  mutate(CoC = coc_name) %>%
  select("CoC",'pop_category', 'emergency_shelter', 'transitional_housing', 'unsheltered')

return(df1)

#}

out.matrix <- extract_pit('https://files.hudexchange.info/reports/published/CoC_PopSub_CoC_CA-612-2019_CA_2019.pdf', "Glendale")
View(out.matrix)
