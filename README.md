# Carbon Labels for Climate Justice
Repository for the data and code used to develop cumulative loss of life over 2020-2100, per kg of Co2 eq emissions for a given product of service, under a 2.4ºC warming scenario for the year 2100.

## Installation Guide
This analysis was conducted in [R](https://www.r-project.org) version 4.3.3 which can be run on a wide variety of UNIX platforms, Windows and MacOS. R is released under the GNU General Public License [(GPL)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html), version 2 or version 3. It can be downloaded from https://www.r-project.org and is typically installed within 5 minutes.  There are no non-standard hardware or resources needed to run R on a typical computer.

The dependencies for this analysis include three libraries which are downloaded from the Comprehensive R Archive Network (CRAN), and include “tidyverse”, “readxl”, and “zoo”.

## Running the analysis

Download the repo,  and run the following `mortalitycostofcarboncalculations.R`, which includes a demo for calculating the impact of a transatlantic flight.

## Input Data
For data on population up to 2100, we used the [UNDP predictions](https://population.un.org/wpp/) of population, life expectancy at birth and median age globally and by country/region.

For estimates of climate-related mortality, we used the mortality cost of carbon (MCC) developed in [Bressler 2021](https://doi.org/10.1038/s41467-021-24487-w), and which are derived from mortality estimates from [Carleton et al., 2022](https://doi.org/10.1093/qje/qjac020), [Hales et al., 2014](https://iris.who.int/bitstream/handle/10665/134014/9789241507691_eng.pdf) & [Gasparrini et al., 2017](https://doi.org/10.1016/S2542-5196(17)30156-0). We use the optimal emissions scenario (DICE-EMR, which projects net-zero by 2050, aligned with the Paris agreement), and which posits 2.4ºC warming by 2100, which is likely an underestimate.  The MCC  accounts for the beneficial effects of income growth and climate adaptation and for mortality as a result of heat-stress, as well as a range of additional morbidities due to changing incidence of disease, murder response and intergroup conflict response. The optimal emissions scenario estimates are that 1.07x10E-4 excess deaths globally from 2020 to 2100 are attributable to 1 metric ton of carbon released in 2020. Put in other words, 9345 metric tons released in 2020 is equivalent to 1 life lost between now and 2100.   We used life cycle assessments for food items from [Kim et al. 2020](https://doi.org/10.1016/j.gloenvcha.2019.05.010) and for flights from Google flights to estimate CO2eq emissions associated with products and services.

## Analysis
For our analysis, we used the MCC calculated in Bressler 2021 to develop estimates of the equivalencies of a life to attribute how many seconds/minutes/hours/days etc would be lost of a person’s life for every kg of CO2eq emitted. We used UNDP projections of population to identify the average global median ages and life expectancies between 2020 and 2100 (we sensitivity check this assumption below with regional specific mortality and demographic estimates). We then used the estimated mortality calculated in Bressler 2021 to calculate a weighted median age, life expectancy and life expectancy at median age of the global population for each five year period over 2020-2100. This was used to develop a cumulative seconds lost/kg CO2eq value which we used to estimate the effect that the emissions from food items and flights incur. Examples are shown in the main text and in Figure SI 2.

## Sensitivity Analysis
As a common sense check, we derived a separate calculation based on the mortality costs estimated in Carleton et al., 2022, which included regional breakdowns. For RCP 4.5 (~2.6ºC warming by 2100), we estimated approximately 1.1M mortality cost in  the 2100 due to climate change effects, which aligned with the 1.3M estimated by Bressler 2021, which is likely slightly higher due to it including mortalities other than just heat-stress which were reported in Carleton et al. 2022. 

## Additional Impacts
We expand our estimates of impact to additional dimensions. We identify US specific dietary shifts potential savings from Kim et al. 2020 current baseline - ⅔ vegan diets emissions, multiplied by the current US population (330M), multiplied by 76 years (lifespan). We sum this product in CO2eq  and divide this sum from the emissions required for RCP 4.5 (~2.6ºC warming by 2100) which work out at 5700 GT CO2eq  given a transient response to warming of t=f/0.45, where t is in GTCO2eq  and f = 2.6ºC. We then multiply this proportion by the median marginal values of projected future coastal flooding from IPPC aligned K14 model from Table 1 of [Kulp and Strauss, 2019](https://doi.org/10.1038/s41467-019-12808-z), that is, the people today living in coastal zones that would be permanently flooded due to climate change, irrespective of future population growth,  which is ~90M for the year 2100.  When including population growth, this estimate more than doubles.

## Additional Notes
The calculations presented here are likely an underestimate. The optimal scenario for second and minutes lost we use posits 2.4ºC or  warming by 2100, and an emissions trajectory where emissions are gradually reduced to a full decarbonization in 2050, which under current trajectories are likely too low. Further, we only use marginal sea level rise estimates, and population growth will increase the damages. Note, we have converted emissions into CO2 equivalents integrated over a 100 year lifetime  and more fine tuned estimates require studies to map the lifetime of different species of greenhouse gas emissions and warming potentials for each product consumed, and to map those contributions to the emissions budgets against time dependent mortality. However, for food items in particular where this may be problematic we reduce overall emissions by using only cradle to farm gate emissions, rather than full cradle to fork life cycle assessments to ensure over accounting is limited e.g. on ruminant meat. These calculations are all intended to be illustrative.











