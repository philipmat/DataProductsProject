
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(DT)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("World-wide smartphone sales"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("quarters",
                "Quarters from 2011 - 2015",
                min = 1,
                max = 36,
                value = c(20,36)),
    selectInput('sort', 'Sort', c('Time', 'Reverse time'))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("plot"),
    hr(),
    h3("Sales data ", em("(in thousands)", style = 'font-size: smaller; color: gray')),
    dataTableOutput('table')
  )
))
