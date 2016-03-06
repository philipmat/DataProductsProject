
library(shiny)
library(DT)

shinyUI(
    fluidPage(
        titlePanel("World-wide smartphone sales"),
        # 3 columns for the settings panel and 8 for the chart, offset by 1
        fluidRow(
            column(3,   
                h4('Display Settings'),
                sliderInput("quarters",
                    "Quarters from 2007 - 2015",
                    min = 1,
                    max = 36,
                    value = c(20,36)),
                selectInput('sort', 'Data Sort', c('Time', 'Reverse time')),
                hr(),
                p('See "How to use the application" below for assistance.')
            ),
            column(8, offset=1,
                h4('Operating Systems Trends'),
                plotOutput("plot")
            )
        ),
        # need a lot of room for the data
        fluidRow(
            column(11,
                hr(),
                h3("Sales data ", em("(in thousands)", style = 'font-size: smaller; color: gray')),
                dataTableOutput('table')
            )
        ),
        # now show the documentation
        fluidRow(
            column(12,
                hr(),
                h2("How to use the application"),
                p("There are 36 quarters of data from 2007 to 2015. In this period of time, some operating systems have all but vanished from the market, while new entrants have conquered both new and previously help territories."),
                p("As such, it is often more useful to examine the trends over shorter periods of time, typically 8 quarters.")
            )
        ),
        # one column for slider, one for data sort
        fluidRow(
            column(6,
                p("The slider labelled ", em('Quarters from 2007 - 2015'), " allows you to select such a window and in response will affect the ", em("Operating Systems Trend"), " chart as well as the ", em("Sales data"), " table below.")
            ),
            column(6,
                p("The drop-down labelled ", em('Data Sort'), "will impact how the data is displayed in the", em("Sales Data"), "table."),
                p("If", em('Time'), "is chosen, the table will display the quarter in natural order of time. If", em('Reverse time'), "is chosen, the more recent entries will be shown first."),
                p("You can also use the chevrons to the right of each column to sort that column, but be aware that the sorting of individual columns resets once new data is loaded throuh the quarters slider.")
            )
        )
    )
)