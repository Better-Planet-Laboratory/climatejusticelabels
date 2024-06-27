# Carbon Labels for Climate Justice
Repository for the data and code used to develop calculations of loss of life per kg of carbon emissions under a 2.4ºC warming scenario for the year 2100

## Input Data
For data on population up to 2100, we used the [UNDP predictions](https://population.un.org/wpp/) of population, life expectancy at birth and median age globally and by country/region.

For estimates of climate-related mortality, we used the mortality cost of carbon (MCC) developed in [Bressler 2021](https://doi.org/10.1038/s41467-021-24487-w), and which are derived from mortality estimates from [Carleton et al., 2022](https://doi.org/10.1093/qje/qjac020), [Hales et al., 2014](https://iris.who.int/bitstream/handle/10665/134014/9789241507691_eng.pdf) & [Gasparrini et al., 2017](https://doi.org/10.1016/S2542-5196(17)30156-0). We use the optimal emissions scenario which posits 2.4ºC warming by 2100, which is likely an underestimate but more realistic of global trajectories compared to 4ºC+ warming scenarios which are based on [RCP8.5 and less likely to occur](https://www.carbonbrief.org/explainer-the-high-emissions-rcp8-5-global-warming-scenario/#:~:text=5%20by%20the%20end%20of,high%2Dforcing%20scenarios%20like%20RCP8.).  The MCC used accounts of the beneficial effects of income growth and climate adaption and accounts for mortality as a result of heat-stress, other morbidities including changing incidence of disease, murder response and integroup conflict response as well.  The optimal emissions scenario estimates are that 1.07x10E-4 excess deaths globally from 2020 to 2100 are attributable to 1 metric ton of carbon released in 2020.  Put in other words, 9345 metric tons released in 2020 is equivalent to 1 life lost between now and 2100.  The MCC of the baseline scenario (4.1ºC warming by 2100) is estimated to be 1 death for every 4424 metric tones released today.

## Analysis to determine the mortality cost of 1 kg CO2 in terms of seconds/minutes/hours
For our analysis, we used the MCC calculated in Bressler 2021 to develop estimates of the equivalencies of a life to attribute how many seconds/minutes/hours/days etc. are lost off of a life for every kg of CO2 emitted.  We used UNDP projections of population to come up with average global median ages and life expectancies between 2020 and 2100.  We then used the estimated dead calculated in Bressler 2021 to calculated the a weighted median age, life expectancy and life expectancy at median age for the period of 2020-2100.  This was used to develop a seconds lost/kg CO2 value which we used to estimate the effect that the emissions of any product or service would have on a livelihoods in terms of time lost.

The calculations presented here are likely an underestimate.  The optimal scenario we used posits 2.4ºC warming by 2100, and an emissions trajectory where emissions are gradually reduced to a full recarbonization in 2050, which under current trajectories have a high level of uncertainty.

As a common sense check, we derived a seperate calculation based on the mortality costs estimated in [Carleton et al., 2022](), which had breakdowns by region.  For RCP 4.5 (~2.6ºC warming by 2100), we estimated approximately 1.1M dead in 2100 due to climate change effects, which aligned well with the 1.3M estimated by Bressler 2021, which is likely slightly higher due to it including mortalities other than just heat-stress which were reported in Carleton et al. 2022.











