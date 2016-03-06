
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)
library(reshape2)
library(dplyr)
library(DT)
# avoid scientific notation
options(scipen=999)

# read smart phone sales data
data = read.csv('smartphone_sales.csv', header = TRUE, na.strings = c('-', 'N/A'), colClasses = c('character', rep('numeric', 10)))
data[is.na(data)] <- 0

shinyServer(function(input, output) {
    output$plot <- renderPlot({
        # we're only taking the quarters specified. 
        # since the data is already sorted, the quarter range matches the row range
        # we only care about the first 9 columns
        # however, to display it in the chart we'll have to transform it 
        # from wide table to tall table
        plot.data <- data[input$quarters[1]:input$quarters[2],1:9] %>%
            melt(c('Quarter'))
        colnames(plot.data) <- c('Quarter', 'OS', 'Sales')
        ggplot(plot.data, aes(x=Quarter, y=Sales, group=OS, color=OS)) +
            geom_line() +
            theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
    })
    output$table <- renderDataTable(datatable({
        # we're only taking the quarters specified. 
        # since the data is already sorted, the quarter range matches the row range
        plot.data <- data[input$quarters[1]:input$quarters[2],]
        # if we're not sorting by time, we're sorting by reverse time
        if(input$sort != 'Time') {
            plot.data <- arrange(plot.data, desc(Quarter))
        }
        # formatting the numbers for display
        plot.data[,-1] <- sapply(plot.data[,-1], prettyNum, big.mark=',', digits=2, format='d')
        data <- plot.data
    }))
    output$range <- renderPrint({ input$quarters})
    output$total <- renderText({ format(sum(data$Total.Smartphones[input$quarters[1]:input$quarters[2]] * 1000), big.mark = ',', nsmall=0) })
})
