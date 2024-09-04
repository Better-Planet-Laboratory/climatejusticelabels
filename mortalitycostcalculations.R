#Install relevant packaged and load libraries
CRAN<-c("http://cran.us.r-project.org")
install_version("devtools", version = "2.4.5", repos = CRAN)
install_version("tidyverse", version = "2.0.0", repos = CRAN)
install_version("readxl", version = "1.4.3", repos = CRAN)
install_version("zoo", version = "1.8-12", repos = CRAN)
install_version("microbenchmark", version = "1.4.10", repos = CRAN)

library(tidyverse)
library(readxl)
library(zoo)
library(microbenchmark)

#Load UNDP population data predictions, select for relevant column and world averages
undp <- read_excel("WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", sheet="Medium variant", skip=16)
undp_short <- undp %>% select("Region, subregion, country or area *", 
                              "Year",
                              "Median Age, as of 1 July (years)",
                              "Life Expectancy at Birth, both sexes (years)",
                              )

undp_world <- undp_short %>% filter(`Region, subregion, country or area *`=="WORLD")


#Convert columns to numeric
undp_world$`Median Age, as of 1 July (years)` <- as.numeric(undp_world$`Median Age, as of 1 July (years)`)
undp_world$`Life Expectancy at Birth, both sexes (years)` <- as.numeric(undp_world$`Life Expectancy at Birth, both sexes (years)`)
undp_world <- undp_world %>% select(-`Region, subregion, country or area *`)


#Calculate 5-year averages of life expectancies and median ages
undp_world <- undp_world %>% filter(Year>2024)
names(undp_world)[names(undp_world) == 'Year'] <- 'date'
z <- read.zoo(undp_world, format = "%Y")
tt <- as.integer(as.yearmon(as.Date(cut(time(z), "5 years"))))
undp_world_agg <- aggregate(z, tt, mean)
undp_world_agg <- fortify.zoo(undp_world_agg)
names(undp_world_agg)[names(undp_world_agg) == 'Index'] <- 'Year'


#Load additional deaths (mortality cost of carbon, MCC) due to the climate change under the DICE-EMR Optimal Trajectory (From Bressler 2021, Nat Comm)
mcc_deaths <- read_csv("newmcc.csv")
mcc_deaths$Dead <- mcc_deaths$Dead*10000000
mcc_deaths <- mcc_deaths %>% filter(Year>2024)


#Calculate life expectancy left from median age 
undp_world_agg$med_LE <- undp_world_agg$`Life Expectancy at Birth, both sexes (years)`- undp_world_agg$`Median Age, as of 1 July (years)`


#Join 5-avg median life expectancies with MCC
undp_world_agg_mcc <- left_join(undp_world_agg, mcc_deaths, by="Year")
undp_world_agg_mcc$totaldead <- sum(undp_world_agg_mcc$Dead)
undp_world_agg_mcc$deadfrac <- undp_world_agg_mcc$Dead/undp_world_agg_mcc$totaldead


#Calculate average median life expectancy between 2020-2100 based on ratios of dead by year
undp_world_agg_mcc$wgt_dead_le <- undp_world_agg_mcc$deadfrac*undp_world_agg_mcc$med_LE
totalLE=sum(abs(undp_world_agg_mcc$wgt_dead_le))
totalLE_sec <- totalLE*365.25*24*60*60


#Calculate the number of seconds equivalent to 1 kg of CO2
#9317895 kg CO2 (9317.895 T) is equal to 1 life lost between 2020-2100 (From Bressler 2021, Nat Comm)
# 1 life lost is equal to 40.91652 years (or 1313477721 seconds) based on the weighted life expectancies & median age between 2020 and 2100
kg_mcc <- totalLE_sec/9317895
# 1kg CO2 is equal to approximately 141 seconds off of a life

#basic function to calculate the number of hours lost per kg of CO2
#we can multiple the total emissions by our derived seconds lost/kg factor
hours_lost <- function(kg){
  return(kg*kg_mcc/60/60)
}

#A worked example
#eg. RT Flight London to New York is 409 KG of CO2
#A return flight from London to New York should take 16.0 hours off of someone's life
hours_lost(409)

#this function can be used for other products which Co2eq and is very fast. Please see notes in the README for further information. 
microbenchmark(hours_lost(409))



