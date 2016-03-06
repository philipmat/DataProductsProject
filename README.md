# World-wide Smartphone Sales
### Project for the Developing Data Products on Coursera

The project is a small app that uses the UI widgets provided by [shiny](http://shiny.rstudio.com/)
to load and display slices of world-wide smartphone sales data.

Data was obtained from [Wikipedia](https://en.wikipedia.org/wiki/Mobile_operating_system)
and is presented with the app as `smartphone_sales.csv`.

## Running the app

To run this app you will require to install several R packages:

* shiny - supporting the app environment
* ggplot2 - for charts
* reshape2 and dplyr - for data manipulation
* DT - for displaying data tables

Install these packages running the following command in R Studio:

```
> install.packages(c('shiny', 'ggplot2', 'reshape2', 'dplyr', 'DT'))
```

Then either click the *Run App* button in R Studio, or in 
the console type:

```
> library(shiny)
> runApp('dataproducts-project')
```
