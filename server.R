
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

data = read.csv('smartphone_sales.csv', header = TRUE, na.strings = c('-', 'N/A'), colClasses = c('character', rep('numeric', 10)))
data[is.na(data)] <- 0

shinyServer(function(input, output) {
    # read smart phone sales data
    output$plot <- renderPlot({
        plot.data <- data[input$quarters[1]:input$quarters[2],1:9] %>%
            melt(c('Quarter'))
        colnames(plot.data) <- c('Quarter', 'OS', 'Sales')
        ggplot(plot.data, aes(x=Quarter, y=Sales, group=OS, color=OS)) +
            geom_line() +
            theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
    })
    output$table <- renderDataTable(datatable({
        plot.data <- data[input$quarters[1]:input$quarters[2],]
        if(input$sort != 'Time') {
            plot.data <- arrange(plot.data, desc(Quarter))
        }
        plot.data[,-1] <- sapply(plot.data[,-1], prettyNum, big.mark=',', digits=2, format='d')
        data <- plot.data
    }))
    output$range <- renderPrint({ input$quarters})
})
