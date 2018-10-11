## Introduction to shinycssloaders package (A package by Andras Sali)
## Add loader animations (spinners) to Shiny Outputs
## A demo example of adding an animated CSS spinner/loader while R plot is loading

## Load required packages
library(shiny) # for shiny components
library(plotly) # for plotly chart
## install.packages("shinycssloaders")  ## install the package if not already
library(shinycssloaders)  # for animated CSS loader


## ui component begins here
ui <- fluidPage(
  h4("Introduction to shinycssloaders package (A package by Andras Sali)"),
  h5("A demo example of adding an animated CSS spinner/loader while R plot is loading"),
    # with the spinner
  withSpinner(plotlyOutput("plot1"))
) 

## server component begins here
server <- function(input, output, session) {

 ## Rendering a plotly graph 
output$plot1 <- renderPlotly({
    Sys.sleep(5) # Adding intentional delay in the execution of plot to demo the loading spinner.
    plot_ly(data=mtcars, 
            x=~wt, 
            y=~mpg,
            type = "scatter", 
            mode = "markers",
            color = ~as.factor(cyl),
            colors = "Set1")
  })
  
}

shinyApp(ui, server)