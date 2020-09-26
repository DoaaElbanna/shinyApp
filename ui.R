#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    headerPanel("Iris k-means cluster"),
    h2("There is a documentaion that must help you to have an overview for this project"),
    h3("Data set information:"),
    p("This famous (Fisher's or Anderson's) iris data set gives the measurements
      in centimeters of the variables sepal length and width and petal length 
      and width, respectively, for 50 flowers from each of 3 species of iris. 
      The species are Iris setosa, versicolor, and virginica,
      It contains 150 cases (rows) and 5 variables (columns)."),
    h3("The idea of the project:"),
    p("defines an application that will compute k-means clusters of the Iris data, 
      allowing the user which features to use for the clustering and how many clusters to use."),
    

    # Choose the features to use for cluster
    sidebarLayout(
        sidebarPanel(
            selectInput("xcol", "X variable", names(iris)),
            selectInput("ycol", "Y variable", names(iris), 
                        selected = names(iris)[[2]]),
            numericInput("clusters", "Clusters count", 3, min = 1, max = 9)
            
        ),
            

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1")
        )
    )
))
