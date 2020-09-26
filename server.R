#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    selectedData <- reactive({iris[,c(input$xcol, input$ycol)]
    })
    clusters <- reactive({kmeans(selectedData(), input$clusters)})
    output$plot1 <- renderPlot({

        # generate plot
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex =4, lmd = 4)
    })

})
