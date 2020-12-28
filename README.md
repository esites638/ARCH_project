# README #

This repository hosts the code and data used in the Addressing Rural Communities and Homelessness (ARCH) Project done by Health Leads in partnership with Dignity Health. The goal of this phase of the project is to analyze and visualize data on indicators of homelessness and housing insecurity in rural California in order to understand the landscape of essential needs throughout the state. We aimed to make data analysis as accessible as possible, and so used publicly-available data and create publicly-available and accessible data vizualization tools. 

The final data vizualizations are publicly available on the analyst's Tableau Public page: 

https://public.tableau.com/views/MapViewerforAddressingRuralCommunitiesandHomelessness/ComparingIndicators?:language=en&:display_count=y&:origin=viz_share_link

https://public.tableau.com/views/HHI_maps/NavigationPane?:language=en&:display_count=y&:origin=viz_share_link

# Using Point-in-time data - converting_pit_script.R #

Data on homelessness is vital to understanding the magnitude of need in California, but such data is also notoriously difficult to find and access. The annual Poin-in-Time count is the most complete data set on where people are unsheltered or in transitional/emergency shelter. The bulk of this project's work was in converting the multiple PDF reports into machine-readable data that could be used for analysis and vizualization. Converting_pit_script.R contains the code used to map the tabulizer function over multiple, irregular PDF files. 
