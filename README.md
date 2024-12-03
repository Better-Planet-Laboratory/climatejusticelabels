[![DOI](https://zenodo.org/badge/821106906.svg)](https://doi.org/10.5281/zenodo.13942100)

# Incorporate climate injustice into carbon labels

Repository containing supporting notes for Mehrabi, Z. and Braich, G. 2024. Incorporate climate injustice into carbon labels, Nature Human Behaviour, as well the code and example data for reproducing the numbers presented in this paper.

<img width="1155" alt="Fig1" src="https://github.com/Better-Planet-Laboratory/climatejusticelabels/blob/main/Supplementary%20Figures/Fig1_fin.png">

## Notes
Here we report the calculations we use to illustrate the logic for human impact labeling, drawing on reporting emissions from Google Flights, life cycle assessments, heat mortality related deaths from, sea level rise data and population statistics. Briefly, we illustrate calculations of cumulative loss of life over 2020-2100, per kg of CO<sub>2</sub><sub>eq</sub> emissions for a given product of service, under a 2.4ºC warming scenario for the year 2100.

### Input Data
For data on population up to 2100, we used the UNDP predictions<sup>1</sup> of population, life expectancy at birth and median age globally and by country/region. For estimates of climate-related mortality, we used the mortality cost of carbon (MCC) developed in Bressler 2021<sup>2</sup>, and which are derived from mortality estimates from Carleton et al., 2022<sup>3</sup>, Hales et al., 2014<sup>4</sup> & Gasparrini et al., 2017<sup>5</sup>. We use the optimal emissions scenario (DICE-EMR, which projects net-zero by 2050, aligned with the Paris agreement), and which posits 2.4ºC warming by 2100. This is a likely underestimate. The MCC accounts for the beneficial effects of income growth and climate adaptation and for mortality as a result of heat-stress, as well as a range of additional morbidities due to changing incidence of disease, murder response and intergroup conflict response. The optimal emissions scenario estimates are that 1.07x10E-4 excess deaths globally from 2020 to 2100 are attributable to 1 metric ton of carbon released in 2020. Put in other words, 9345 metric tons released in 2020 is equivalent to 1 life lost between now and 2100. We used life cycle assessments for food items from Kim et al., 2020<sup>6</sup> and for flights from Google flights to estimate CO<sub>2</sub><sub>eq</sub> emissions associated with products and services.

### Analysis
For our analysis, we used the MCC calculated in Bressler 2021 to develop estimates of the equivalencies of a life to attribute how many seconds/minutes/hours/days etc. would be lost off of a person’s life for every kg of CO<sub>2</sub><sub>eq</sub> emitted. We used UNDP projections of population to come up with average global median ages and life expectancies between 2020 and 2100 (we sensitivity check this assumption below). We then used the estimated mortality calculated in Bressler 2021 to calculate a weighted median age, life expectancy and life expectancy at median age of the global population for each five year period over 2020-2100. This was used to develop a cumulative seconds lost/kg CO<sub>2</sub><sub>eq</sub> value which we used to estimate the effect that the emissions from food items and flights incur. Examples are shown in the main text and in this repository.

### Sensitivity check
As a common sense check, we derived a separate calculation based on the mortality costs estimated in Carleton et al., 2022, which included regional breakdowns. For RCP 4.5 (~2.6ºC warming by 2100), we estimated approximately 1.1M mortality cost in the 2100 due to climate change effects, which aligned with the 1.3M estimated by Bressler 2021, which is slightly higher likely due to it including mortalities other than just heat-stress which were reported in Carleton et al. 2022.

### Additional impacts
We expand our estimates of impact to additional dimensions. We identify US specific dietary shifts potential savings from Kim et al., 2020 current baseline - ⅔ vegan diets emissions, multiplied by the current US population (334.9M), multiplied by 75 years (approximate average lifespan and time to 2100). We sum this product in CO<sub>2</sub><sub>eq</sub> and divide this sum from the emissions required for RCP 4.5 (~2.6ºC warming by 2100) to get which work out at 5700 GT CO<sub>2</sub><sub>eq</sub> given a transient response to warming of t=f/0.45, where t is in GT CO<sub>2</sub><sub>eq</sub> and f = 2.6ºC. We then multiply this proportion by the median marginal values of projected future coastal flooding from IPPC aligned K14 model from Table 1 of Kulp and Strauss, 2019<sup>7</sup>, that is, the people today living in coastal zones that would be permanently flooded due to climate change, irrespective of future population growth, ~90M for the year 2100. When including population growth, this estimate more than doubles.

### Additional notes
The calculations presented here are likely an underestimate. The optimal scenario for seconds and minutes lost we use posits 2.4ºC warming by 2100, and an emissions trajectory where emissions are gradually reduced to a full decarbonization in 2050, which under current trajectories are likely too low. Further, we only use marginal sea level rise estimates, and population growth will increase the damages. Note, we have converted emissions into CO<sub>2</sub> equivalents integrated over a 100 year lifetime and more fine tuned estimates require studies to map the lifetime of different species of greenhouse gas emissions and warming potentials for each product consumed, and to map those contributions to the emissions budgets against time dependent mortality. However, for food items in particular where this may be problematic we reduce overall emissions by using only cradle to farm gate emissions, rather than full cradle to fork life cycle assessments to ensure over accounting is limited e.g. on ruminant meat. These calculations are all intended to be illustrative.

### References
1.	UNDP Population Statistics. Accessed from: https://population.un.org/wpp/
2.	Bressler, R.D. The mortality cost of carbon. Nature Communications 12, 4467 (2021).
3.	Carleton, T. et al. Valuing the Global Mortality Consequences of Climate Change Accounting for Adaptation Costs and Benefits. The Quarterly Journal of Economics 137, 2037–2105 (2022).
4.	Hales, S. et al. Quantitative risk assessment of the effects of climate change on selected causes of death, 2030s and 2050s (World Health Organization, 2014).
5.	Gasparrini, A. et al. Projections of temperature-related excess mortality under climate change scenarios. Lancet Planet. Health 1, e360–e367 (2017).
6.	Kim, B.F. et al. Country-specific dietary shifts to mitigate climate and water crises.
Global Environmental Change 62, 101926 (2020).
7.	Kulp, S.A., Strauss, B.H. New elevation data triple estimates of global vulnerability to sea-level rise and coastal flooding. Nature Communications 10, 4844 (2019).


## Installation Guide
This analysis was conducted in [R](https://www.r-project.org) version 4.3.3 which can be run on a wide variety of UNIX platforms, Windows and MacOS. R is released under the GNU General Public License [(GPL)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html), version 2 or version 3. It can be downloaded from https://www.r-project.org and is typically installed within 5 minutes.  There are no non-standard hardware or resources needed to run R on a modern desktop. The dependencies for this analysis include three libraries which are downloaded from the Comprehensive R Archive Network (CRAN), and include “tidyverse”, “readxl”, and “zoo”.

### Running the analysis
Download the repo,  and run the following `mortalitycostcalculations.R`, which includes a demo for calculating the impact of a transatlantic flight. Each new product estimate takes less than 150 nanoseconds to complete on an Apple M1 Pro with 32GB RAM.

### License
The data methodology is distributed is under a MIT License.













