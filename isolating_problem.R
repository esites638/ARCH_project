library(dplyr)
library(tabulizer)
install.packages("shiny")
install.packages("miniUI")
library(shiny)
library(miniUI)


# url of pdf file
location_chico <- 'https://files.hudexchange.info/reports/published/CoC_PopSub_CoC_CA-519-2019_CA_2019.pdf'
location__vallejo <- 'https://files.hudexchange.info/reports/published/CoC_PopSub_CoC_CA-518-2019_CA_2019.pdf'
location_colusa <- 'https://files.hudexchange.info/reports/published/CoC_PopSub_CoC_CA-523-2019_CA_2019.pdf'

tab_vallejo <- extract_tables(location__vallejo, pages = 1:2)
tab_chico <- extract_tables(location_chico, pages= 1:2)
tab_colusa <- extract_tables(location_colusa, pages= 1)


extract_pit(location_colusa, "Colusa/Glen")