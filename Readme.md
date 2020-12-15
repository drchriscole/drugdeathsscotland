[![DOI](https://zenodo.org/badge/100367876.svg)](https://zenodo.org/badge/latestdoi/100367876)

# Drug-related deaths in Scotland 2019

A repository for analysing [National Records of Scotland](https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/deaths/drug-related-deaths-in-scotland) annual data on drug-related deaths in Scotland.

Primarily this is an exercise dataviz to improve on the hard-to-digest spreadsheet tables to improve on the understanding of themes and trends.

Starting with the 2018 data there is substantially more regional detail which makes for a lot more analysis. As I'm based in Dundee, I've highlighted the serious problem that exists here.

## MyBinder Jupyter Notebook testing

Rstudio [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/drchriscole/drugdeathsscotland/master?filepath=rstudio)

This launches a full and working Rstudio environment to run the code interactively.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/drchriscole/drugdeathsscotland/master?filepath=DRD_in_Scotland_Visualisations.Rmd)

The mybinder docker instance builds and loads except the ```forcats``` library isn't installed. A minor issue as only one plot is dependent on it.

